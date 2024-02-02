from flask import Flask, request, render_template, redirect, url_for, make_response
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash
from flask import jsonify
import os
from datetime import datetime, time
from flask import flash

app = Flask(__name__)
app.config['SECRET_KEY'] = os.urandom(24)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///my_database.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
login_manager = LoginManager()
login_manager.login_view = 'login'
login_manager.init_app(app)

speakers = db.Table('speakers',
    db.Column('user_id', db.Integer, db.ForeignKey('user.id'), primary_key=True),
    db.Column('event_id', db.Integer, db.ForeignKey('event.id'), primary_key=True)
)

organizers = db.Table('organizers',
    db.Column('user_id', db.Integer, db.ForeignKey('user.id'), primary_key=True),
    db.Column('event_id', db.Integer, db.ForeignKey('event.id'), primary_key=True)
)

class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(15), unique=True)
    email = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(80))
    role = db.Column(db.String(20))
    speaker_events = db.relationship('Event', secondary=speakers, backref=db.backref('speakers', lazy='dynamic'))
    organized_events = db.relationship('Event', backref='organizer', lazy='dynamic')

class Event(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True)
    organizer_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    description = db.Column(db.String(500))
    type = db.Column(db.String(20))
    start_date = db.Column(db.DateTime)
    end_date = db.Column(db.DateTime)
    start_time = db.Column(db.Time)
    address = db.Column(db.String(200))
    price = db.Column(db.Float)
    image_file = db.Column(db.String(20), nullable=False, default='default.jpg')

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

@app.route('/')
def main_page():
    return render_template('sem-login.html', current_user=current_user)

@app.route('/criar_evento', methods=['GET', 'POST'])
@login_required
def create_event():
    if current_user.role != 'Gestor':
        return redirect(url_for('main_page'))
    
    if request.method == 'POST':
        name = request.form['titulo']
        description = request.form['description']
        type = request.form.get('type')  # Assuming this comes from checkbox/radio buttons
        start_date = datetime.strptime(request.form.get('start_date', ''), '%Y-%m-%d') if request.form.get('start_date') else None
        end_date = datetime.strptime(request.form.get('end_date', ''), '%Y-%m-%d') if request.form.get('end_date') else None
        start_time = datetime.strptime(request.form.get('start_time', ''), '%H:%M').time() if request.form.get('start_time') else None
        address = request.form.get('address')  # Add this input field to your form
        price = float(request.form['preco'])
        image_file = request.form.get('image_file')  # Add this input field to your form

        event = Event(name=name, organizer_id=current_user.id, description=description, type=type, start_date=start_date, 
                      end_date=end_date, start_time=start_time, address=address, price=price, image_file=image_file)

        db.session.add(event)
        db.session.commit()

        flash('Evento criado com sucesso!', 'success')
        return redirect(url_for('event', event_id=event.id))

    return render_template('criar-evento.html')

@app.route('/evento/<int:event_id>')
def event(event_id):
    event = Event.query.get_or_404(event_id)
    return render_template('evento.html', title=event.name, event=event, current_user=current_user)

@app.route('/login', methods=['GET', 'POST'])
def login():
    # Redirect user if already logged in
    if current_user.is_authenticated:
        return redirect(url_for('main_page'))

    error = ''
    if request.method == 'POST':
        user = User.query.filter_by(username=request.form['username']).first()
        if user and check_password_hash(user.password, request.form['password']):
            login_user(user, remember=True)
            return redirect(url_for('main_page'))
        else:
            error = 'Invalid username or password'
            return render_template('login.html', error=error)
    return render_template('login.html', error=error)

@app.route('/register', methods=['GET', 'POST'])
def register():
    # Redirect user if already logged in
    if current_user.is_authenticated:
        return redirect(url_for('main_page'))

    error = ""

    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        confirm_password = request.form['confirm-password']
        role = request.form['role']

        if role == "escolha":
            error = 'Please select a role!'
            return render_template('registo.html', error=error)

        if User.query.filter_by(username=username).first():
            error = 'Username already exists!'
            return render_template('registo.html', error=error)

        if User.query.filter_by(email=email).first():
            error = 'Email already exists!'
            return render_template('registo.html', error=error)

        if password != confirm_password:
            error = 'Passwords do not match!'
            return render_template('registo.html', error=error)

        hashed_password = generate_password_hash(password, method='sha256')
        new_user = User(username=username, email=email, password=hashed_password, role=role)
        db.session.add(new_user)
        db.session.commit()
        return redirect(url_for('login'))

    return render_template('registo.html', error=error)

@app.route('/search_event', methods=['POST'])
def search_event():
    name = request.form.get('name-event')
    type_event = request.form.get('type-event')
    date_event = request.form.get('date-event')

    events = Event.query

    if name:
        events = events.filter(Event.name.ilike('%' + str(name) + '%'))

    if type_event:
        events = events.filter(Event.type == type_event)
        
    if date_event:
        date_event = datetime.strptime(date_event, '%Y-%m-%d')
        events = events.filter(Event.start_date <= date_event, Event.end_date >= date_event)

    events = events.all()

    results = []
    for event in events:
        results.append({
            "name": event.name,
            "id": event.id
        })
    return jsonify(results)

@app.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('login'))

def add_users():
    # Users to be added
    users = [
        {"username": "gestor", "email": "gestor@example.com", "password": "password", "role": "Gestor"},
        {"username": "palestrante", "email": "palestrante@example.com", "password": "password", "role": "Palestrante"},
        {"username": "participante", "email": "participante@example.com", "password": "password", "role": "Participante"}
    ]

    for user_info in users:
        # Check if user already exists
        user = User.query.filter_by(username=user_info["username"]).first()
        if not user:
            hashed_password = generate_password_hash(user_info["password"], method='sha256')
            new_user = User(username=user_info["username"], email=user_info["email"], password=hashed_password, role=user_info["role"])
            db.session.add(new_user)

    # Commit the changes
    db.session.commit()

def add_events():
    # Events to be added
    events = [
        {
            "name": "Cultural Event 1", 
            "organizer": "gestor",
            "description": "This is a cultural event.", 
            "type": "Cultural", 
            "start_date": datetime(2023, 6, 1), 
            "end_date": datetime(2023, 6, 5), 
            "start_time": time(10, 0),
            "address": "123 Culture St", 
            "price": 10.0, 
            "image_file": "header--avatar4.svg"
        },
        {
            "name": "Educational Event 1", 
            "organizer": "gestor",
            "description": "This is an educational event.", 
            "type": "Educational", 
            "start_date": datetime(2023, 7, 1), 
            "end_date": datetime(2023, 7, 5), 
            "start_time": time(9, 0),
            "address": "456 Education Rd", 
            "price": 20.0, 
            "image_file": "header--avatar4.svg"
        },
        {
            "name": "Workshop de Pintura Aquarela para Iniciantes", 
            "organizer": "Pinturas+",
            "description": "Workshop de pintura para Iniciantes.", 
            "type": "Educational", 
            "start_date": datetime(2023, 7, 1), 
            "end_date": datetime(2023, 7, 5), 
            "start_time": time(9, 0),
            "address": "Porto", 
            "price": 20.0, 
            "image_file": "header--avatar4.svg"
        },
        {
            "name": "Exposição de Fotografia Olhares do Mundo", 
            "organizer": "Fotografias+",
            "description": "Exposição de Fotografia.", 
            "type": "Cultural", 
            "start_date": datetime(2023, 7, 1), 
            "end_date": datetime(2023, 7, 5), 
            "start_time": time(9, 0),
            "address": "Porto", 
            "price": 0.0, 
            "image_file": "header--avatar4.svg"
        },
        {
            "name": "Exposição de Fotografia American Corner", 
            "organizer": "Fotografias+",
            "description": "Exposição de Fotografia.", 
            "type": "Cultural", 
            "start_date": datetime(2023, 7, 1), 
            "end_date": datetime(2023, 7, 5), 
            "start_time": time(9, 0),
            "address": "Aveiro", 
            "price": 0.0, 
            "image_file": "header--avatar2.svg"
        },
        {
            "name": "Workshop de Cozinha Portuguesa e os seus Segredos", 
            "organizer": "Cozinha+",
            "description": "Workshop de Cozinha.", 
            "type": "Educacional", 
            "start_date": datetime(2023, 7, 1), 
            "end_date": datetime(2023, 7, 5), 
            "start_time": time(9, 0),
            "address": "Lisboa", 
            "price": 65.0, 
            "image_file": "header--avatar2.svg"
        },
        {
            "name": "Palestra A História da Literatura Portuguesa ", 
            "organizer": "Palestras+",
            "description": "Palestra sobre a história da literatura portuguesa.", 
            "type": "Educacional", 
            "start_date": datetime(2023, 7, 1), 
            "end_date": datetime(2023, 7, 5), 
            "start_time": time(9, 0),
            "address": "Aveiro", 
            "price": 0.0, 
            "image_file": "header--avatar2.svg"
        },
        {
            "name": "Seminário de Empreendedorismo e Inovação", 
            "organizer": "Seminários+",
            "description": "Seminário de um dia sobre Empreendedorismo.", 
            "type": "Educacional", 
            "start_date": datetime(2023, 7, 1), 
            "end_date": datetime(2023, 7, 5), 
            "start_time": time(9, 0),
            "address": "Aveiro", 
            "price": 0.0, 
            "image_file": "header--avatar2.svg"
        },
        {
            "name": "Curso de Culinária Saudável e Sustentável", 
            "organizer": "Culinária+",
            "description": "Aprenda a preparar pratos deliciosos.", 
            "type": "Educacional", 
            "start_date": datetime(2023, 7, 1), 
            "end_date": datetime(2023, 7, 5), 
            "start_time": time(9, 0),
            "address": "Aveiro", 
            "price": 0.0, 
            "image_file": "header--avatar2.svg"
        }
    ]

    for event_info in events:
        # Check if event already exists
        event = Event.query.filter_by(name=event_info["name"]).first()
        if not event:
            organizer = User.query.filter_by(username=event_info["organizer"]).first()
            new_event = Event(
                name=event_info["name"], 
                organizer_id=organizer.id if organizer else None,
                description=event_info["description"], 
                type=event_info["type"], 
                start_date=event_info["start_date"], 
                end_date=event_info["end_date"], 
                start_time=event_info["start_time"], 
                address=event_info["address"], 
                price=event_info["price"], 
                image_file=event_info["image_file"]
            )
            db.session.add(new_event)
            speaker = User.query.filter_by(username="palestrante").first()
            if speaker:
                new_event.speakers.append(speaker)

    # Commit the changes
    db.session.commit()

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
        add_users()
        add_events()
    app.run(debug=True)
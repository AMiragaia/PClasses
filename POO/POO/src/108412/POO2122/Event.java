import java.util.*;
import java.time.*;

public class Event implements IEvent {
    private String data;
    private Set<Activity> lista = new TreeSet<Activity>();
    public Event(String data,TreeSet<Activity> lista){
        this.data = data;
        this.lista = lista;

    }
    public LocalDate getDate(){
        return java.time.LocalDate.now();

    }

	public void setData(String data) {
		this.data = data;
	}

    public Set<Activity> lista(){
        return lista;
    }
    public void setActivity(Set<Activity> lista){
        this.lista = lista;
    }
    public double totalCost(){
        int x = 0;
        x = x*lista.size();
        return x;
    }

    public Event addActivity(Activity activity){ 
        lista.add(activity);

    }



    
    
}

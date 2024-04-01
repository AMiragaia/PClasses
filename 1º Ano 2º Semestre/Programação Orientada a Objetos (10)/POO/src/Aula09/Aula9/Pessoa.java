package Aula9;

public class Pessoa {

    private String name;
    private int citizenCardNumber;
    private Date dateOfBirth;

    public Pessoa(String name, int citizenCardNumber, Date dateOfBirth) {
        this.name = name;
        this.citizenCardNumber = citizenCardNumber;
        this.dateOfBirth = dateOfBirth;
    }

    public Pessoa() {
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCitizenCardNumber() {
        return this.citizenCardNumber;
    }

    public void setCitizenCardNumber(int citizenCardNumber) {
        this.citizenCardNumber = citizenCardNumber;
    }

    @Override
    public String toString() {
        return this.name + "; CC: " + this.citizenCardNumber + ", Data de Nascimento " + this.dateOfBirth;
    }

    @Override
    public int hashCode(){
        return citizenCardNumber;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Pessoa)) {
            return false;
        }
        Pessoa pessoa = (Pessoa) o;
        return (pessoa.name == name && citizenCardNumber == pessoa.citizenCardNumber && pessoa.dateOfBirth == dateOfBirth);
    }


}




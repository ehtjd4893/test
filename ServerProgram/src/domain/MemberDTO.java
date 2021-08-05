package domain;

public class MemberDTO {

	private int no;
	private String id;
	private String name;
	private String grade;
	private int point;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grad) {
		this.grade = grad;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [no=" + no + ", id=" + id + ", name=" + name + ", grade=" + grade + ", point=" + point
				+ ", getNo()=" + getNo() + ", getId()=" + getId() + ", getName()=" + getName() + ", getGrade()="
				+ getGrade() + ", getPoint()=" + getPoint() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}

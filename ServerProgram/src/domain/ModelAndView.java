package domain;

public class ModelAndView {

	private boolean isRedrirect;
	private String view;
	

	public ModelAndView() {
	}
	
	public ModelAndView(boolean isRedrirect, String view) {
		this.isRedrirect = isRedrirect;
		this.view = view;
	}
	public boolean isRedrirect() {
		return isRedrirect;
	}
	public void setRedrirect(boolean isRedrirect) {
		this.isRedrirect = isRedrirect;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	
	@Override
	public String toString() {
		return "ModelAndView [isRedrirect=" + isRedrirect + ", view=" + view + "]";
	}
	
	
}

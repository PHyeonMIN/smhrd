package MapDTO;

public class MapVO {
	String map_seq;
	String map_name;
	String map_latitude;
	String map_longtitude;
	String map_type;
	String map_stars;
	String map_info;
	String map_addr;
	public MapVO(String map_seq, String map_name, String map_latitude, String map_longtitude, String map_type,
			String map_stars, String map_info, String map_addr) {
		super();
		this.map_seq = map_seq;
		this.map_name = map_name;
		this.map_latitude = map_latitude;
		this.map_longtitude = map_longtitude;
		this.map_type = map_type;
		this.map_stars = map_stars;
		this.map_info = map_info;
		this.map_addr = map_addr;
	}
	public String getMap_seq() {
		return map_seq;
	}
	public void setMap_seq(String map_seq) {
		this.map_seq = map_seq;
	}
	public String getMap_name() {
		return map_name;
	}
	public void setMap_name(String map_name) {
		this.map_name = map_name;
	}
	public String getMap_latitude() {
		return map_latitude;
	}
	public void setMap_latitude(String map_latitude) {
		this.map_latitude = map_latitude;
	}
	public String getMap_longtitude() {
		return map_longtitude;
	}
	public void setMap_longtitude(String map_longtitude) {
		this.map_longtitude = map_longtitude;
	}
	public String getMap_type() {
		return map_type;
	}
	public void setMap_type(String map_type) {
		this.map_type = map_type;
	}
	public String getMap_stars() {
		return map_stars;
	}
	public void setMap_stars(String map_stars) {
		this.map_stars = map_stars;
	}
	public String getMap_info() {
		return map_info;
	}
	public void setMap_info(String map_info) {
		this.map_info = map_info;
	}
	public String getMap_addr() {
		return map_addr;
	}
	public void setMap_addr(String map_addr) {
		this.map_addr = map_addr;
	}
	
	
	
}

package olap.it.edu.itba.tp;

import com.vividsolutions.jts.geom.Geometry;
import com.vividsolutions.jts.io.ParseException;
import com.vividsolutions.jts.io.WKBReader;


public class Intersection {
	public static String getIntersection(String a, String b){
		if(b == null && a == null){
			return null;
		}else if( b == null){
			return a;
		}else if( a == null ){
			return b;
		}
		WKBReader info = new WKBReader();
		Geometry elem1;
		Geometry elem2;
		try {
			
			elem1 = info.read(WKBReader.hexToBytes(a));
			elem2 = info.read(WKBReader.hexToBytes(b));
			return elem1.intersection(elem2).toString();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}
}



package com.arr.mctc;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Service {

	public String bustops(String latlon) {
		String jsoncont = "";
		String distanceInMeters = "";

		String nearbybustops = "";
		
		
		
	

		String urlLink = "https://maps.googleapis.com/maps/api/place/search/json?location="
				+ latlon
				+ "&radius=500&types=bus_station&sensor=false&key=AIzaSyCS7iRYF0cbnzz6Odn7zWuDLculFzW0vcU";

		try {
			URL url = new URL(urlLink);
			URLConnection connection = url.openConnection();

			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(connection.getInputStream()));

			StringBuffer stringBuffer = new StringBuffer();

			String line = "";

			while ((line = bufferedReader.readLine()) != null) {
				stringBuffer.append(line);
			}

			jsoncont = stringBuffer.toString();

		} catch (MalformedURLException e) {
			System.out
					.println("MalformedURLException while reading json from net "
							+ e.toString());

		} catch (IOException e) {
			System.out.println("IOException while reading json from net "
					+ e.toString());

		} catch (Exception e) {
			System.out.println("Exception while reading json from net "
					+ e.toString());

		}

		try {
			JSONParser jsParser = new JSONParser();

			Object object = jsParser.parse(jsoncont);

			JSONObject json = (JSONObject) object;

			JSONArray resultsarray = (JSONArray) json.get("results");

			for (int i = 0; i < resultsarray.size(); i++) {

				JSONObject resultObject = (JSONObject) resultsarray.get(i);

				JSONObject geometry_object = (JSONObject) resultObject
						.get("geometry");

				JSONObject location_object = (JSONObject) geometry_object
						.get("location");

				String lattiude = String.valueOf(location_object.get("lat"));
				String longitude = String.valueOf(location_object.get("lng"));
				String latlong = lattiude + "," + longitude;

				String busstopis = String.valueOf(resultObject.get("name"));

				System.out.println("latlon:" + latlong + "[" + i + "]");
				System.out.println("busstopis:" + busstopis + "[" + i + "]");

				String urlLink1 = "http://maps.googleapis.com/maps/api/distancematrix/json?origins="
						+ latlon
						+ "&destinations="
						+ latlong
						+ "&mode=driving&sensor=false";

				try {
					URL url1 = new URL(urlLink1);
					URLConnection connection1 = url1.openConnection();

					BufferedReader bufferedReader1 = new BufferedReader(
							new InputStreamReader(connection1.getInputStream()));

					StringBuffer stringBuffer = new StringBuffer();

					String line = "";

					while ((line = bufferedReader1.readLine()) != null) {
						stringBuffer.append(line);
					}

					jsoncont = stringBuffer.toString();

					try {
						JSONParser jsParser1 = new JSONParser();

						Object object1 = jsParser1.parse(jsoncont);

						JSONObject json1 = (JSONObject) object1;

						System.out.println("destination_addresses : "
								+ json1.get("destination_addresses"));

						JSONArray rowsArray = (JSONArray) json1.get("rows");

						JSONObject elementsObject = (JSONObject) rowsArray
								.get(0);

						JSONArray elementsArray = (JSONArray) elementsObject
								.get("elements");

						JSONObject jsonObject2 = (JSONObject) elementsArray
								.get(0);

						JSONObject distanceObject = (JSONObject) jsonObject2
								.get("distance");

						distanceInMeters = String.valueOf(distanceObject
								.get("value"));

						System.out.println("distance " + distanceInMeters
								+ " Meters and : " + distanceObject.get("text")
								+ " Kms");

						if (distanceInMeters.contains("m")) {
							distanceInMeters = distanceInMeters.substring(0,
									distanceInMeters.indexOf("m")).trim();
						}

						if (distanceInMeters.contains("k")) {
							distanceInMeters = distanceInMeters.substring(0,
									distanceInMeters.indexOf("k")).trim();
						}

						System.out.println("kmmmmmmmmmm" + distanceInMeters);
						distanceInMeters = distanceObject.get("text")
								.toString();

					} catch (ParseException e) {
						System.out.println("JSON ParseException : "
								+ e.toString());

					} catch (Exception e) {
						System.out.println("json1 Exception : " + e.toString());

					}

					nearbybustops = nearbybustops + "ARR" + "Bus Stop Name:"
							+ busstopis + "\n" + "Location:[" + latlong + "]\n"
							+ "Distance:" + distanceInMeters;

				} catch (MalformedURLException e) {
					System.out
							.println("MalformedURLException while reading json from net "
									+ e.toString());

				} catch (IOException e) {
					System.out
							.println("IOException while reading json from net "
									+ e.toString());

				} catch (Exception e) {
					System.out.println("Exception while reading json from net "
							+ e.toString());

				}

			}

		} catch (ParseException e) {
			System.out.println("JSON ParseException : " + e.toString());

		} catch (Exception e) {
			System.out.println("JSON Exception : " + e.toString());

		}

		int pos = nearbybustops.indexOf("ARR");

		nearbybustops = nearbybustops.substring(pos + 3);

		System.out.println("nearbybustops" + nearbybustops);

		return nearbybustops;
	}

	
//  search for near by bus stops by google api and by our logic
	
public static String bustops_logic(String latlon) {
		
		
		// search for near by bus stop by google
		
		ArrayList<String> near_by_bustop_by_google = new ArrayList<String>();
		
		
		String jsoncont = "";
		String distanceInMeters = "";

		String nearbybustops = "";
		
		
		ArrayList<String> nearbybusstops_list = new ArrayList<String>();

		String urlLink = "https://maps.googleapis.com/maps/api/place/search/json?location="
				+ latlon
				+ "&radius=2000&types=bus_station&sensor=false&key=AIzaSyCS7iRYF0cbnzz6Odn7zWuDLculFzW0vcU";

		try {
			URL url = new URL(urlLink);
			URLConnection connection = url.openConnection();

			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(connection.getInputStream()));

			StringBuffer stringBuffer = new StringBuffer();

			String line = "";

			while ((line = bufferedReader.readLine()) != null) {
				stringBuffer.append(line);
			}

			jsoncont = stringBuffer.toString();

		} catch (MalformedURLException e) {
			System.out
					.println("MalformedURLException while reading json from net "
							+ e.toString());

		} catch (IOException e) {
			System.out.println("IOException while reading json from net "
					+ e.toString());

		} catch (Exception e) {
			System.out.println("Exception while reading json from net "
					+ e.toString());

		}

		try {
			JSONParser jsParser = new JSONParser();

			Object object = jsParser.parse(jsoncont);

			JSONObject json = (JSONObject) object;

			JSONArray resultsarray = (JSONArray) json.get("results");

			for (int i = 0; i < resultsarray.size(); i++) {

				JSONObject resultObject = (JSONObject) resultsarray.get(i);

				JSONObject geometry_object = (JSONObject) resultObject
						.get("geometry");

				JSONObject location_object = (JSONObject) geometry_object
						.get("location");

				String lattiude = String.valueOf(location_object.get("lat"));
				String longitude = String.valueOf(location_object.get("lng"));
				String latlong = lattiude + "," + longitude;

				String busstopis = String.valueOf(resultObject.get("name"));
				
				near_by_bustop_by_google.add(busstopis);
				
				nearbybusstops_list.add(busstopis);
				

				System.out.println("latlon:" + latlong + "[" + i + "]");
				System.out.println("busstopis:" + busstopis + "[" + i + "]");

				String urlLink1 = "http://maps.googleapis.com/maps/api/distancematrix/json?origins="
						+ latlon
						+ "&destinations="
						+ latlong
						+ "&mode=driving&sensor=false";

				try {
					URL url1 = new URL(urlLink1);
					URLConnection connection1 = url1.openConnection();

					BufferedReader bufferedReader1 = new BufferedReader(
							new InputStreamReader(connection1.getInputStream()));

					StringBuffer stringBuffer = new StringBuffer();

					String line = "";

					while ((line = bufferedReader1.readLine()) != null) {
						stringBuffer.append(line);
					}

					jsoncont = stringBuffer.toString();

					try {
						JSONParser jsParser1 = new JSONParser();

						Object object1 = jsParser1.parse(jsoncont);

						JSONObject json1 = (JSONObject) object1;

						System.out.println("destination_addresses : "
								+ json1.get("destination_addresses"));

						JSONArray rowsArray = (JSONArray) json1.get("rows");

						JSONObject elementsObject = (JSONObject) rowsArray
								.get(0);

						JSONArray elementsArray = (JSONArray) elementsObject
								.get("elements");

						JSONObject jsonObject2 = (JSONObject) elementsArray
								.get(0);

						JSONObject distanceObject = (JSONObject) jsonObject2
								.get("distance");

						distanceInMeters = String.valueOf(distanceObject
								.get("value"));

						System.out.println("distance " + distanceInMeters
								+ " Meters and : " + distanceObject.get("text")
								+ " Kms");

						if (distanceInMeters.contains("m")) {
							distanceInMeters = distanceInMeters.substring(0,
									distanceInMeters.indexOf("m")).trim();
						}

						if (distanceInMeters.contains("k")) {
							distanceInMeters = distanceInMeters.substring(0,
									distanceInMeters.indexOf("k")).trim();
						}

						System.out.println("kmmmmmmmmmm" + distanceInMeters);
						distanceInMeters = distanceObject.get("text")
								.toString();

					} catch (ParseException e) {
						System.out.println("JSON ParseException : "
								+ e.toString());

					} catch (Exception e) {
						System.out.println("json1 Exception : " + e.toString());

					}

					nearbybustops = nearbybustops + "ARR" + "Bus Stop Name:"
							+ busstopis + "\n" + "Location:[" + latlong + "]\n"
							+ "Distance:" + distanceInMeters;

				} catch (MalformedURLException e) {
					System.out
							.println("MalformedURLException while reading json from net "
									+ e.toString());

				} catch (IOException e) {
					System.out
							.println("IOException while reading json from net "
									+ e.toString());

				} catch (Exception e) {
					System.out.println("Exception while reading json from net "
							+ e.toString());

				}

			}

		} catch (ParseException e) {
			System.out.println("JSON ParseException : " + e.toString());

		} catch (Exception e) {
			System.out.println("JSON Exception : " + e.toString());

		}

		int pos = nearbybustops.indexOf("ARR");

		nearbybustops = nearbybustops.substring(pos + 3);

		
		// next line onwards search for near by bus stop...note: bus stop which are added manually
		
		
		String originaddress = latlon;
		String destination_address = "";

		ArrayList<String> destination_busstop = new ArrayList<String>();
		ArrayList<String> destination_busstop_location = new ArrayList<String>();
		
		ArrayList<Integer> poistion = new ArrayList<Integer>();
		ArrayList<Integer> poistion_distance = new ArrayList<Integer>();
		

		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
			Statement stmt = connection.createStatement();

			String sqlquery = "SELECT * FROM Bus_stopss";

			// System.out.println(sqlquery);

			ResultSet buffer = stmt.executeQuery(sqlquery);

			int i = 0;
			while (buffer.next())

			{

				String latt_longi = buffer.getString("latlon");
				String bus_stop_name = buffer.getString("bus_stop_name");

				destination_busstop.add(i, bus_stop_name);
				destination_busstop_location.add(i, latt_longi);

				destination_address = destination_address + "|" + latt_longi;
				i++;
			}

			//System.out.println("i value" + i);

			//System.out.println(destination_address);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String json_contents = "";

		//String urlLink = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=12.268617,76.622501&destinations=12.276459,76.623013|12.306041,76.656436&mode=walking&sensor=false";
		
		String urlinks_to_searchmanually = "http://maps.googleapis.com/maps/api/distancematrix/json?origins="+originaddress+"&destinations="+destination_address+"&mode=walking&sensor=false";

		try {
			URL url = new URL(urlinks_to_searchmanually);
			URLConnection connection = url.openConnection();

			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(connection.getInputStream()));

			StringBuffer stringBuffer = new StringBuffer();

			String line = "";

			while ((line = bufferedReader.readLine()) != null) {
				stringBuffer.append(line);
			}

			json_contents = stringBuffer.toString();

			// System.out.println(jsoncont);

		} catch (MalformedURLException e) {
			System.out
					.println("MalformedURLException while reading json from net "
							+ e.toString());

		} catch (IOException e) {
			System.out.println("IOException while reading json from net "
					+ e.toString());

		} catch (Exception e) {
			System.out.println("Exception while reading json from net "
					+ e.toString());

		}

		try {

			JSONParser jsParser = new JSONParser();

			Object object = jsParser.parse(json_contents);

			JSONObject json = (JSONObject) object;

			JSONArray rowsarray = (JSONArray) json.get("rows");

			JSONObject preElementObject = (JSONObject) rowsarray.get(0);

			JSONArray elementsarray = (JSONArray) preElementObject.get("elements");

			//System.out.println(elementsarray);

			
			 for (int i = 0; i < elementsarray.size(); i++) {
			 
			 JSONObject element_Object = (JSONObject) elementsarray.get(i);
			 
			 JSONObject distance_object =(JSONObject)element_Object.get("distance");
			 String meters = String.valueOf(distance_object.get("value"));
			 
			 	int in_meters = Integer.parseInt(meters);
			 	
			 	if(in_meters<=2000)
			 	{
			 		
			 		poistion.add(i);
			 		System.out.println("position added at"+i+"th position");
			 		poistion_distance.add(in_meters);
			 		System.out.println("distance in meters:"+meters); 
			 	}
			 
			
			 }
		

		} catch (Exception e) {
			System.out.println("Exception " + e.toString());
		}
		
		int postisize = poistion.size();
		
		System.out.println("posssion sizzzze"+postisize);
		
		for (int i = 0; i <poistion.size(); i++) {
			
			int a = poistion.get(i);
			int stop_distance = poistion_distance.get(i);
			
			
			
			String stopname = destination_busstop.get(a);
			String stoplocation = destination_busstop_location.get(a);
			
			if(near_by_bustop_by_google.contains(stopname))
			{
				System.out.println("already added by google api");
			}else
			{
				nearbybustops = nearbybustops + "ARR" + "Bus Stop Name:"
				+ stopname + "\n" + "Location:[" + stoplocation + "]\n"
				+ "Distance:" + stop_distance+" meters";
			}
			
			
			System.out.println(stopname+":"+stoplocation+"Distance is"+stop_distance);
			
		}
	

		System.out.println("nearbybustops" + nearbybustops);
		
		return nearbybustops;
	}

	
	
	
	
	public String busroutes(String bustop) {
		System.out.println("i callling" + bustop);
		String returnresult = "no";

		try {

			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection connection = DriverManager
					.getConnection("jdbc:odbc:tram");
			Statement stmt = connection.createStatement();

			String sqlquery = "SELECT * FROM busnumber where Via LIKE '%"+ bustop.trim() + "%'";

			System.out.println(sqlquery);

			ResultSet buffer = stmt.executeQuery(sqlquery);

			while (buffer.next()) {

				String Bus_no = buffer.getString("Bus_no");

				System.out.println("Bus_no" + Bus_no);
				String From_ = buffer.getString("From_");
				String To_ = buffer.getString("To_");
				String Via = buffer.getString("Via");

				returnresult = returnresult + "ARR" + "Bus No" + ":" + Bus_no
						+ "\n" + "From:" + From_ + "\n" + "To:" + To_ + "\n"
						+ "Via:" + Via+"\n";

			}

		} catch (ClassNotFoundException ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		} catch (SQLException ex) {
			// TODO Auto-generated catch block
			ex.printStackTrace();
		}

		int pos = returnresult.indexOf("ARR");
		returnresult = returnresult.substring(pos + 3);
		System.out.println("returnresult" + returnresult);
		
		
		return returnresult;
	}
	
	
	
	public String track_records(String busno,String bustopname)
	{
		ArrayList<String> imeino = new ArrayList<String>();

		String resultis ="no";
		
		System.out.println("busno"+busno);
		System.out.println("bustopname"+bustopname);
		
		
		
		try {

			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
			Statement stmt = connection.createStatement();

			String sqlquery = "SELECT imei FROM Bus_details where bus_no ='"+busno.trim()+"' ";
			ResultSet buffer = stmt.executeQuery(sqlquery);

			System.out.println("sqlquery"+sqlquery);
			int i=0;
			while (buffer.next()) {
				String imei = buffer.getString("imei");
				
				
				System.out.println("imei"+imei);
				
				imeino.add(i,imei);
				i = i+1;
			}
			

			
			for (int j = 0; j < imeino.size(); j++) 
			{
				String im = imeino.get(j);
				
				System.out.println("im"+im);
				
				
				String sqlquery1 ="SELECT top 1 imei,Track_id,location,time_is from Track_Details where imei = '"+im+"' and next_stops LIKE '%"+ bustopname.trim() + "%' order by Track_id desc";
				
				System.out.println("sqlquery1"+sqlquery1);
				ResultSet buffer1 = stmt.executeQuery(sqlquery1);
				while(buffer1.next())
				{	
					String imei_no = buffer1.getString("imei");
					String loc = buffer1.getString("location");
					String tim = buffer1.getString("time_is");
					
					resultis = resultis+"ARR"+imei_no+">"+loc+">"+tim;
					System.out.println("resultisaaaaaaaaa"+resultis);
				}

			}
			
			System.out.println("resultis"+resultis);
			
			

		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		try{
		int pos = resultis.indexOf("ARR");
		resultis = resultis.substring(pos + 3);
		System.out.println("returnresult" + resultis);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resultis;
	}
	
	
	
	public String myroute(String imei) {
		
		
		String Via="";

		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
			Statement stmt = connection.createStatement();
			String sqlquery = "SELECT Via FROM busnumber INNER JOIN Bus_details ON busnumber.Bus_no = Bus_details.bus_no where imei='"+imei+"'    ";
			System.out.println(sqlquery);

			ResultSet buffer = stmt.executeQuery(sqlquery);

			while (buffer.next()) {

				 Via = buffer.getString("Via");
			}

		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		
		Via = Via.trim();
		
		return Via;
	}
	
	public String update_track(String imei,String loc, String dest,String nextstops) {
		
		System.out.println(loc);
		String Via="server updated";

		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
			Statement stmt = connection.createStatement();
			
			int rs1=  stmt.executeUpdate("DELETE from Track_Details where imei='"+imei+"'");
			
			System.out.println("rs1"+rs1);
			
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			String post_date = formatter.format(new Date());

			SimpleDateFormat formatter1 = new SimpleDateFormat("hh:mm:a");
			String post_time = formatter1.format(new Date());
			
			String sql = "INSERT INTO Track_Details(imei,location,Destiny,next_stops,date_is,time_is)"+ " VALUES ('"+imei+"','"+loc+"','"+dest+"','"+nextstops+"','"+post_date+"','"+post_time+"')";
		    stmt.executeUpdate(sql);
		    System.out.println("sql"+sql);
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		
		
		
		return Via;
	}
	

}

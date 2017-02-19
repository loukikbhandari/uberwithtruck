package com.psl.client;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;



public class Main {

	public static void main(String[] args) {
		
		String a = "1";
		String b= "2";
		
		int c = Integer.parseInt(a + b);
		System.out.println(c);
		
		int d =10;
		
		System.out.println(c+d);
		
		
		
	/*	String time = "10:30";
		String date = "2014-10-30";
		
		String date2 = "2014-10-3112:45";
		String date1 = date + time;
		System.out.println(date1);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-ddHH:mm");
		Calendar cal  = Calendar.getInstance();
		Calendar cal1  = Calendar.getInstance();

		try {
			cal.setTime(df.parse(date1));
			cal1.setTime(df.parse(date2));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("time is " + cal.getTime() + "  " + cal1.getTime());
		*/
		
		
		/*System.out.println("hii");
		SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		
		Session session= sf.openSession();
		System.out.println("in main..");
		String date = "2014-10-30";
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		try {
			date1 = format.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Status status  = new Status();
		status.setRoomID(1);
		status.setDate(date1);
		status.setStatus(0);
		
		StatusDao statusdao = new StatusDao();
		statusdao.addStatus(status);*/
		/*
		User usr = new User();
		Room room = new Room();
		
		room.setRoomID(1234);
		room.setCapacity(100);
		room.setLocation("PT");

		room.setRoomName("plainum");
		room.setRoomType("soft skills");
		
	//	session.save(room);
		
		usr.setDesignation("Trainer");
		usr.setEmployeeFirstName("pawan");
		usr.setEmployeeLastName("sawant");
		usr.setEmployeeID(1);
		usr.setPassword("sarang");
		usr.setUsername("sarang");
		usr.setUserType("Administrator");
		
		
	//	session.save(usr);

		Location loc = new Location();
		
		
		loc.setLocationId(8);
		loc.setLocationName("Bhageerath");*/
//		session.save(status);
//		
//		session.beginTransaction().commit();
	}
}

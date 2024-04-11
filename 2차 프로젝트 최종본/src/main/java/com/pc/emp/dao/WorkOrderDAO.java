package com.pc.emp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.pc.emp.dto.WorkOrderDTO;

public class WorkOrderDAO {

   public List selectTable(String local) {
      List list = new ArrayList();

      String driver = "oracle.jdbc.driver.OracleDriver";
      String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
      String user = "unchild";
      String password = "mesteam";

      try {
         Class.forName(driver);

         Connection con = DriverManager.getConnection(url, user, password);

         String query = "";

         if (local.equals("/workOrder")) {

            query += " SELECT" + " w_bord_seq, w_title, w_detail, w_imgUrl";
            query += " FROM" + " workBord";
            query += " WHERE" + " w_type = 1";
         } else if (local.equals("/workSafety")) {

            query += " SELECT" + " w_bord_seq, w_title, w_detail, w_imgUrl";
            query += " FROM" + " workBord";
            query += " WHERE" + " w_type = 2";
         } else if (local.equals("/workQuality")) {

            query += " SELECT" + " w_bord_seq, w_title, w_detail, w_imgUrl";
            query += " FROM" + " workBord";
            query += " WHERE" + " w_type = 3" + " OR" + " w_bord_seq = 13";
         } else if (local.equals("/workReport")) {

//            query += " SELECT"
//                  + " "
         }

         PreparedStatement ps = con.prepareStatement(query);

         ResultSet rs = ps.executeQuery();

         while (rs.next()) {

            int seq = rs.getInt(1);
            String title = rs.getString(2);
            String detail = rs.getString(3);
            String urlImage = rs.getString(4);

            WorkOrderDTO dto = new WorkOrderDTO();
            dto.setSeq(seq);
            dto.setTitle(title);
            dto.setDetail(detail);
            dto.setUrlImage(urlImage);

            list.add(dto);
         }

         rs.close();
         ps.close();

         if (local.equals("/workQuality")) {

            query = "";
            query += " SELECT" + " procId, lineNum, endtime, pass, g_sequence";
            query += " FROM" + " testh";
            query += " WHERE" + " qualitychk = 0";

            PreparedStatement ps2 = con.prepareStatement(query);
            ResultSet rs2 = ps2.executeQuery();

            while (rs2.next()) {

               int goodsSeq = rs2.getInt("procId");
               String line = rs2.getString("lineNum");
               Date date = rs2.getDate("endtime");
               int quantity = rs2.getInt("pass");
               int model = rs2.getInt("g_sequence");

               // Date 타입을 문자열로 변환
               SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
               String hireDate = format.format(date);

               WorkOrderDTO dto = new WorkOrderDTO();
               dto.setGoodsSeq(goodsSeq);
               dto.setLine(line);
               dto.setModel(model);
               dto.setHireDate(hireDate);
               dto.setQuantity(quantity);
               list.add(dto);
            }

            rs2.close();
            ps2.close();

            query = "";
            query += " SELECT" + " staffno, sName, sphone, smail";
            query += " FROM" + " staff";
            query += " WHERE" + " staffno = 3002";

            PreparedStatement ps3 = con.prepareStatement(query);
            ResultSet rs3 = ps3.executeQuery();

            if (rs3.next()) {

               int workerId = rs3.getInt(1);
               String workerName = rs3.getString(2);
               String workerTel = rs3.getString(3);
               String workerEmail = rs3.getString(4);

               WorkOrderDTO dto = new WorkOrderDTO();
               dto.setWorkerId(workerId);
               dto.setWorkerName(workerName);
               dto.setWorkerTel(workerTel);
               dto.setWorkerEmail(workerEmail);
               list.add(dto);
            }

            rs3.close();
            ps3.close();
         }

         con.close();

      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return list;
   }

   public void insertInfo(WorkOrderDTO dto, String local) {

      String driver = "oracle.jdbc.driver.OracleDriver";
      String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
      String user = "unchild";
      String password = "mesteam";

      try {
         Class.forName(driver);

         Connection con = DriverManager.getConnection(url, user, password);

         String title = dto.getTitle();
         String detail = dto.getDetail();
         String urlImage = dto.getUrlImage();

         if (local.equals("/workOrder")) {

            detail = detail.replace(System.lineSeparator(), "\\n");
         } else if (local.equals("/workSafety") || local.equals("/workQuality")) {

            detail = "- " + detail.replace(System.lineSeparator(), "\\n- ");
         }

         String query = "";

         if (local.equals("/workOrder")) {

            query += " INSERT INTO" + " workbord(w_bord_seq, w_title, w_detail, w_imgurl, w_type)";
            query += " VALUES" + " (" + " w_bord_seq.NEXTVAL, '" + title + "','" + detail + "','" + urlImage + "',"
                  + " 1" + ")";
         } else if (local.equals("/workSafety")) {

            query += " INSERT INTO" + " workbord(w_bord_seq, w_title, w_detail, w_imgurl, w_type)";
            query += " VALUES" + " (" + " w_bord_seq.NEXTVAL, '" + title + "','" + detail + "','" + urlImage + "',"
                  + " 2" + ")";
         } else if (local.equals("/workQuality")) {

            if (detail != null) {

               query += " INSERT INTO" + " workbord(w_bord_seq, w_title, w_detail, w_type)";
               query += " VALUES" + " (" + " w_bord_seq.NEXTVAL, '" + title + "','" + detail + "'," + " 3" + ")";
               System.out.println(query);
            }
         } else if (local.equals("/facilityUpdate")) {

            int facilitySeq = dto.getFacilitySeq();
            String facilityDetail = dto.getFacilityDetail();
            String sendTime = dto.getSendTime();
            int workerId = dto.getWorkerId();
            int unclear = dto.getUnclear();
            System.out.println("unclear : " + unclear);
            // 날짜타입으로 형변환
            DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
            LocalDateTime time = LocalDateTime.parse(sendTime, format);

            query = "";
            query += " SELECT" + " pass";
            query += " FROM" + " testh";
            query += " WHERE" + " qualitychk = " + facilitySeq;

            PreparedStatement ps2 = con.prepareStatement(query);
            ResultSet rs2 = ps2.executeQuery();

            int clear;

            if (rs2.next()) {

               int clear_num = rs2.getInt("pass");
               System.out.println("unclear2" + unclear);
               clear = clear_num - unclear;

               int defective;
               if (facilityDetail == null) {
                  facilityDetail = "";
                  defective = 0;
               } else {
                  defective = 1;
               }

               query = "";
               query += " INSERT INTO"
                     + " work(w_seq, procid, w_bord_seq, clear_num, unclear_num, status, staffno, end_time)";
               query += " VALUES" + " (" + "w_seq.NEXTVAL," + facilitySeq + ", '" + facilityDetail + "'," + clear
                     + "," + unclear + "," + defective + "," + workerId + ", TO_DATE('" + sendTime
                     + "', 'YYYY-MM-DD HH24:MI')" + ")";
            }

         }

         PreparedStatement ps = con.prepareStatement(query);
         try {

            ps.executeUpdate();
         } catch (Exception e) {
            e.printStackTrace();
         }

         ps.close();
         con.close();

      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

   public void deleteColumn(WorkOrderDTO dto) {

      String driver = "oracle.jdbc.driver.OracleDriver";
      String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
      String user = "unchild";
      String password = "mesteam";

      try {

         Class.forName(driver);

         Connection con = DriverManager.getConnection(url, user, password);

         int seq = dto.getSeq();

         String query = "";

         query += " DELETE FROM" + " workbord";
         query += " WHERE" + " w_bord_seq =";
         query += seq;

         PreparedStatement ps = con.prepareStatement(query);
         ps.executeUpdate();

         ps.close();
         con.close();

      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

   public void retouchColumn(WorkOrderDTO dto, String local) {

      String driver = "oracle.jdbc.driver.OracleDriver";
      String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
      String user = "unchild";
      String password = "mesteam";

      try {

         Class.forName(driver);

         Connection con = DriverManager.getConnection(url, user, password);

         int seq = dto.getSeq();
         String title = dto.getTitle();
         String detail = dto.getDetail();
         String urlImage = dto.getUrlImage();

         int facilitySeq = dto.getFacilitySeq();

         String query = "";

         if (local.equals("/workOrderRetouch") || local.equals("/workSafetyRetouch")) {

            query += " UPDATE" + " workbord";
            query += " SET" + " w_title = '" + title + "'," + " w_detail = '" + detail + "'," + " w_imgurl = '"
                  + urlImage + "'";
            query += " WHERE" + " w_bord_seq = " + seq;
         } else if (local.equals("/workQualityRetouch")) {

            query += " UPDATE" + " workbord";
            query += " SET" + " w_title = '" + title + "'," + " w_detail = '" + detail + "'";
            query += " WHERE" + " w_bord_seq = " + seq;
         } else if (local.equals("/facilityUpdate")) {

            query += " UPDATE" + " testh";
            query += " SET" + " qualitychk = 1";
            query += " WHERE" + " procid = " + facilitySeq;
         }

         PreparedStatement ps = con.prepareStatement(query);
         ps.executeUpdate();

         ps.close();
         con.close();

      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

   public void test(WorkOrderDTO dto, String local) {

      String driver = "oracle.jdbc.driver.OracleDriver";
      String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
      String user = "unchild";
      String password = "mesteam";

      Connection con;
      try {
         con = DriverManager.getConnection(url, user, password);

         int facilitySeq = dto.getFacilitySeq();
         String facilityDetail = dto.getFacilityDetail();
         String sendTime = dto.getSendTime();
         int workerId = dto.getWorkerId();
         int unclear = dto.getUnclear();

         // 날짜타입으로 형변환
         DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
         LocalDateTime time = LocalDateTime.parse(sendTime, format);

         int defective;
         if (facilityDetail == null) {
            facilityDetail = "";
            defective = 0;
         } else {
            defective = 1;
         }
         String query = "";
         query += " INSERT INTO" + " finished(seq, error, facilty_seq, hire_date, defective, worker_id, unclear)";
         query += " VALUES" + " (" + " finished_SEQ.NEXTVAL, '" + facilityDetail + "','" + facilitySeq
               + "', TO_DATE('" + sendTime + "', 'YYYY-MM-DD HH24:MI')" + "," + defective + "," + workerId + ","
               + unclear + ")";

         PreparedStatement ps = con.prepareStatement(query);
         try {

            ps.executeUpdate();
         } catch (Exception e) {
            e.printStackTrace();
         }

         ps.close();
         con.close();

      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

   }

   public List<WorkOrderDTO> report() {


      String driver = "oracle.jdbc.driver.OracleDriver";
      String url = "jdbc:oracle:thin:@112.148.46.134:51521:xe";
      String user = "unchild";
      String password = "mesteam";

      List<WorkOrderDTO> list = new ArrayList<>();
      try {
         Class.forName(driver);

         Connection con = DriverManager.getConnection(url, user, password);
         System.out.println("con" + con);
         String query = "";

         query = "";
         query += " SELECT"
               + " w_seq, procid, w_bord_seq, clear_num, unclear_num, w.staffno, end_time, sname, sphone ,smail, sduty";
         query += " FROM" + " work w";
         query += " INNER JOIN" + " staff s";
         query += " ON w.staffno = s.staffno" + " WHERE w.STAFFNO = 3004";

         System.out.println("query : " + query);

         PreparedStatement ps = con.prepareStatement(query);

         ResultSet rs4 = ps.executeQuery();

         while (rs4.next()) {

            int facilitySeq = rs4.getInt("w_seq");
            int goodsSeq = rs4.getInt("procid");
            String facilityDetail = rs4.getString("w_bord_seq");
            int clear = rs4.getInt("clear_num");
            int workerId = rs4.getInt("staffno");
            Date sendTimeFor = rs4.getDate("end_time");
            String sname = rs4.getString("sname");
            String sphone = rs4.getString("sphone");
            String smail = rs4.getString("smail");
            String sduty = rs4.getString("sduty");

            // Date 타입을 문자열로 변환
            SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-DD HH:mm");
            String sendTime = format.format(sendTimeFor);

            WorkOrderDTO dto = new WorkOrderDTO();
            dto.setFacilitySeq(facilitySeq);
            dto.setGoodsSeq(goodsSeq);
            dto.setFacilityDetail(facilityDetail);
            dto.setClear(clear);
            dto.setWorkerId(workerId);
            dto.setSendTime(sendTime);
            dto.setSname(sname);
            dto.setSphone(sphone);
            dto.setSmail(smail);
            dto.setSduty(sduty);

//               System.out.println("dto" + dto);

            list.add(dto);
         }

         rs4.close();
         ps.close();
         con.close();

      } catch (Exception e) {
         e.printStackTrace();
      }

      System.out.println(list);
      return list;
   }

}
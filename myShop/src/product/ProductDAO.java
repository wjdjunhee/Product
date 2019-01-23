package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;




public class ProductDAO {

	public void insert(ProductDTO dto) throws Exception {
		//1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/product";
		String user = "root";
		String password = "1234";
		
		
		Connection con = DriverManager.getConnection(url, user, password);
		//3. SQL문 객체화
		String sql = "insert into member values (?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getTitle());
		ps.setString(3, dto.getContent());
		ps.setString(4, dto.getPrice());
	
		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료..");
	}
	
	
	public void update(ProductDTO dto) throws Exception {
		//1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/product";
		String user = "root";
		String password = "1234";
		
		
		Connection con = DriverManager.getConnection(url, user, password);
		//3. SQL문 객체화
		String sql = "update member set title = ?, content = ?, price = ? where id = ? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getTitle());
		ps.setString(2, dto.getContent());
		ps.setString(3, dto.getPrice());
		ps.setString(4, dto.getId());
		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료..");
	}
	
	public void delete(String id) throws Exception {
		//1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");
		
		//2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/product";
		String user = "root";
		String password = "1234";
		
		Connection con = DriverManager.getConnection(url, user, password);
		
		//3. SQL문 객체화
		String sql = "delete from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);

		
		//4. SQL문 실행 요청
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료..");
	}
	
	public ProductDTO select(String input) throws Exception {
		// 1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");

		// 2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/product";
		String user = "root";
		String password = "1234";

		Connection con = DriverManager.getConnection(url, user, password);

		// 3. SQL문 객체화
		String sql = "select * from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, input);

		// 4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		ProductDTO dto = null;
		while (rs.next()) { // 커서를 옮겨서 레코드가 있는지 체크
			dto = new ProductDTO();
			String id = rs.getString(1);
			String title = rs.getString(2);
			String content = rs.getString(3);
			String price = rs.getString(4);
			
			dto.setId(id);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setPrice(price);
		}
		return dto;
	}
	
	public ArrayList<ProductDTO> selectAll() throws Exception {
		// 1. 드라이버(connector) 셋팅
		Class.forName("com.mysql.jdbc.Driver");

		// 2. DB연결(->my서버설정+db명+id+pw)
		String url = "jdbc:mysql://localhost:3306/product";
		String user = "root";
		String password = "1234";

		Connection con = DriverManager.getConnection(url, user, password);

		// 3. SQL문 객체화
		String sql = "select * from member";
		PreparedStatement ps = con.prepareStatement(sql);

		// 4. SQL문 실행 요청
		ResultSet rs = ps.executeQuery();
		System.out.println("start " + rs.getRow());
		ProductDTO dto = null;
		ArrayList<ProductDTO> list = new ArrayList<>();
		
		while (rs.next()) { // 커서를 옮겨서 레코드가 있는지 체크
			System.out.println("row: " + rs.getRow());
			dto = new ProductDTO();

			String id = rs.getString(1);
			String title = rs.getString(2);
			String content = rs.getString(3);
			String price = rs.getString(4);
			
			dto.setId(id);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setPrice(price);
			
			list.add(dto);
			System.out.println();
		}
		return list;
	}
	
	
}

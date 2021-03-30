package Board_module;

import java.io.BufferedInputStream;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {

	private DBConnectionMgr pool;
	private static final String  SAVEFOLDER = "C:/Temp/fileupload";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 5*1024*1024;

	public BoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//게시판 목록 불러오기
	public Vector<BoardBean> getBoardList(String keyField, String keyWord,
			int start, int end) {
		Connection conn =null; //자바에서 DB로 sql 전송
		PreparedStatement pstmt =null;//DB에서 자바로 sql 결과 전송
		ResultSet rs =null;//sql문 실행 결과
		String sql =null;//sql 실행 문장
		Vector<BoardBean> vlist =new Vector<BoardBean>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver load Success!");
			conn=pool.getConnection();
			System.out.println("DB load Success!");
			//연동 테스트 끝
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from tableboard order by num desc, pos limit ?,?";
				//참조를 기준으로 내림 차순, 포지션의 처음과 마지막까지값만 출력
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,start);
				pstmt.setInt(2,end);
			} else {
				sql ="select * from tableboard where " + keyField + "like ?";
				sql += "ordef by ref desc, pos limit ? .?";
				pstmt =conn.prepareStatement(sql);
				pstmt.setString(1,"%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setTitle(rs.getString("title"));
				bean.setRef(rs.getInt("ref"));
				bean.setCount(rs.getInt("count"));
				bean.setCount(rs.getInt("count"));
				vlist.add(bean);
			}
		}catch (Exception e){
			e.printStackTrace();
		} finally {
			pool.freeConnection(conn,pstmt,rs);
		}
		return vlist;
	}
	
	
	public int getTotalCount(String keyField, String keyWord) {
		Connection conn = null; //자바에서 DB로 sql문 전송
		PreparedStatement pstmt = null;//DB에서 자바로 결과 전송
		ResultSet rs = null;//sql문 실행 결과
		String sql =null;//sql실행 문장
		int totalCount = 0;
		try {
			conn = pool.getConnection();
			if (keyWord.equals("null")||keyWord.equals("")) {
				sql="select count(num) from tableboard" ;
				pstmt = conn.prepareStatement(sql);
				//키워드가 비워있을 때 키필드에서 count를 찾는다
			} else {
				sql = "select count(num) from tableboard where" + keyField + "like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,"%"+keyWord+"%");//num을 찾는다
				//키워드가 있을 때
			}
			rs =pstmt.executeQuery();//sql문을 실행
			if(rs.next()) {
				totalCount = rs.getInt(1);//컬럼의 첫번 째 숫자를 가지고 온다
			}
		}catch (Exception e) {
			e.printStackTrace(); // 예외 일때 잡아주기
		}finally {
			pool.freeConnection(conn, pstmt, rs); //사용했던 데이터 반환
		}
		return totalCount;
	}
	
	public void insertBoard(HttpServletRequest req) {
		//게시판 글쓰기 기능 구현 
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MultipartRequest multi =null; // 파일 업로드를 위한 변수
		int filesize = 0; //파일 크기
		String filename = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver load Success!");
			conn=pool.getConnection();
			System.out.println("DB load Success!");
			//연동 테스트 끝
			sql = "select max(num) from tableboard"; //큰 숫자 찾는 sql
			pstmt = conn.prepareStatement(sql);
			rs =pstmt.executeQuery();
			int ref =1;
			if (rs.next())
				ref = rs.getInt(1) +1; 
			File file =new File(SAVEFOLDER); //저장된 폴더 
			if(!file.exists())
				file.mkdir();// 파일이 없으면 디렉토리 생성
			multi = new MultipartRequest(req,SAVEFOLDER,MAXSIZE,ENCTYPE,
					new DefaultFileRenamePolicy());
			if(multi.getFilesystemName("filename") != null) {
				filename =multi.getFilesystemName("filename");//파일 이름을 가지고 온다
				filesize = (int) multi.getFile("filename").length(); //파일의 크기를 가지고 온다
			}
			
			
				
			//sql문으로 파라메터 가지고 오기
			sql="insert tableboard(sort,title,content,ip,filename,filesize,pos,count,ref)";
			sql+="values(?,?,?,?,?,?,?,0,0,?)";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(2, multi.getParameter("sort"));//게시판 분류 가지고옴
			pstmt.setString(3, multi.getParameter("title"));//게시판 제목을 가지고옴
			pstmt.setString(4, multi.getParameter("content"));//게시판 내용을 가지고옴
			pstmt.setString(5, multi.getParameter("ip"));//작성자의 IP를 가지고옴
			pstmt.setString(6, filename);//파일 이름을 가지고옴
			pstmt.setInt(7, filesize);//파일 크기를 가지고옴
			pstmt.setInt(8,ref);//참조할 숫자를 가지고옴
			pstmt.executeUpdate();
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace(); //예외 처리
		}finally {
			pool.freeConnection(conn,pstmt,rs);//데이터 반환
		}
	}
	
	
	public BoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setRegdate(rs.getString("regdate"));
				bean.setPass(rs.getString("pass"));
				bean.setCount(rs.getInt("count"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
				bean.setIp(rs.getString("ip"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set count=count+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select filename from tblBoard where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next() && rs.getString(1) != null) {
				if (!rs.getString(1).equals("")) {
					File file = new File(SAVEFOLDER + "/" + rs.getString(1));
					if (file.exists())
						UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
				}
			}
			sql = "delete from tblBoard where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	
	public void updateBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set name = ?, title=?, content = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getTitle());
			pstmt.setString(3, bean.getContent());
			pstmt.setInt(4, bean.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	
	public void replyBoard(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard (name,content,title,ref,pos,depth,regdate,pass,count,ip)";
			sql += "values(?,?,?,?,?,?,now(),?,0,?)";
			int depth = bean.getDepth() + 1;
			int pos = bean.getPos() + 1;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getTitle());
			pstmt.setInt(4, bean.getRef());
			pstmt.setInt(5, pos);
			pstmt.setInt(6, depth);
			pstmt.setString(7, bean.getPass());
			pstmt.setString(8, bean.getIp());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblBoard set pos = pos + 1 where ref = ? and pos > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	
		public void downLoad(HttpServletRequest req, HttpServletResponse res,
				JspWriter out, PageContext pageContext) {
			try {
				String filename = req.getParameter("filename");
				File file = new File(UtilMgr.con(SAVEFOLDER + File.separator+ filename));
				byte b[] = new byte[(int) file.length()];
				res.setHeader("Accept-Ranges", "bytes");
				String strClient = req.getHeader("User-Agent");
				if (strClient.indexOf("MSIE6.0") != -1) {
					res.setContentType("application/smnet;charset=UTF-8");
					res.setHeader("Content-Disposition", "filename=" + filename + ";");
				} else {
					res.setContentType("application/smnet;charset=euc-kr");
					res.setHeader("Content-Disposition", "attachment;filename="+ filename + ";");
				}
				out.clear();
				out = pageContext.pushBody();
				if (file.isFile()) {
					BufferedInputStream fin = new BufferedInputStream(
							new FileInputStream(file));
					BufferedOutputStream outs = new BufferedOutputStream(
							res.getOutputStream());
					int read = 0;
					while ((read = fin.read(b)) != -1) {
						outs.write(b, 0, read);
					}
					outs.close();
					fin.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	
	public void post1000(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,title,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql+="values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//main
	public static void main(String[] args) {
		new BoardMgr().post1000();
		System.out.println("SUCCESS");
	}
}
package mybean.scope;
 
public class RequestScopeBean {
    private String header =""; //머릿말 입력값 저장 변수
    private String footer =""; //꼬릿말 입력값 저장 변수
   
    public String getHeader() { //header.jsp에서 호출하는 메서드
        return header;
    }
 
    public void setHeader(String header) {
        this.header = header;
    }
 
    public String getFooter() { //footer.jsp에서 호출하는 메서드
        return footer;
    }
 
    public void setFooter(String footer) {
        this.footer = footer;
    }
}
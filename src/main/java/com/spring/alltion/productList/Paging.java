package com.spring.alltion.productList;

public class Paging {
	//ȭ�鿡 ������ �Խñ��� ������ ����
	   private int pageSize=10;
	   private int count =0; //��ü ���� ������ �����ϴ� ����
	   private int number =0; //������ �ѹ��� ����
	   private String pageNum;
	 
	   private int startRow;
	   private int endRow;
	    
	   private int currentPage;
	   private int pageCount;
	   private int startPage;   
	   private int pageBlock=10;//ī���͸� ó�� ����
	    
	   private int endPage;
	    
	    
	   private int prev; //����
	   private int next; //����
	   private String html;
	    
	    
	    public Paging(String pageNum) {
	     //���� ó�� productList.jsp�� Ŭ���ϰų� ���� ���� �� �ٸ� �Խñۿ��� �� �������� �Ѿ���� pageNum���� ���⿡ null ó���� ����
	      if(pageNum==null){
	             pageNum="1";
	      }
	      this.pageNum=pageNum;
	       
	      //��ü ������ �ϴ� ���������ڸ� ����
	      currentPage =Integer.parseInt(pageNum);
	    }
	      
	 
	    public void setTotalCount(int count){
	         
	        this.count=count;
	         
	        //���� �������� ������ ���� ��ȣ�� ���� = ������ ���̽����� �ҷ��� ���۹�ȣ
	        startRow =(currentPage-1) *pageSize+1;
	        endRow =currentPage * pageSize;
	         
	        //���̺� ǥ���� ��ȣ�� ����
	        this.number =count - (currentPage -1 ) * pageSize;
	         
	        //������ ���
	        pageCaculator();
	    }
	      
	        
	   public void pageCaculator(){
	    if(count  >0){
	         
	        pageCount =count /pageSize + (count%pageSize == 0 ?  0 :1) ; //ī���͸� ���ڸ� �󸶱��� �����ٰ��� ����
	         
	        //���� ������ ���ڸ� ����
	        startPage =1;
	         
	        if(currentPage %10 !=0){
	            startPage =(int)(currentPage/10)*10+1;
	        }else{
	            startPage =((int)(currentPage/10)-1)*10+1;
	        }
	         
	     
	        endPage =startPage+pageBlock-1;//ȭ�鿡 ������ �������� ������ ����
	        if(endPage > pageCount) endPage =pageCount;
	         
	         
	        //���� ����
	        if(startPage >pageSize)  prev =startPage-10;
	        //����
	        if(endPage < pageCount) next=startPage+10;
	    }           
	   }
	 
	 
	   public void paginHtml(String url){
	    String html= "<div class='pagination' class='text-center'><ul >";   
	    //ó��
	    if(startPage >pageSize){
	        html +="<li><a href='"+url+"&pageNum="+1+"' >"
	                + "  ó��</a></li>";
	    }
	    //�����̶�� ��ũ�� ������� �ľ�
	    if(startPage >pageSize){
	        html +="<li><a href='"+url+"&pageNum="+prev+"' >"
	                + "  &laquo;</a></li>";
	    }
	    //����¡ ó��
	    String active="";
	    for(int i=startPage; i<endPage+1; i++){
	         
	        if(i!=0){
	            if(i==Integer.parseInt(pageNum)) active ="class='active' ";
	            else active=""; 
	            html +="<li " +active+" ><a href='"+url+"&pageNum="+i+"'>"+i+"</a></li>";
	        }
	             
	    }
	     
	    //���� �̶�� ��ũ�� ������� �ľ�
	    if(endPage < pageCount ){
	        html +="<li><a href='"+url+"&pageNum="+next+"' >"
	                + "  &raquo;</a></li>";
	    }
	     
	    //���� �̶�� ��ũ�� ������� �ľ�
	    if(endPage < pageCount ){
	        html +="<li><a href='"+url+"&pageNum="+pageCount+"' >"
	                + "  ������</a></li>";
	    }
	     
	    html +="</ul></nav>";
	 
	    this.html=html;
	     
	   }

	    public int getNumber() {
	        return number;
	    }
	 
	 
	    public void setNumber(int number) {
	        this.number = number;
	    }
	 
	 
	    public int getStartRow() {
	        return startRow;
	    }
	 
	 
	    public void setStartRow(int startRow) {
	        this.startRow = startRow;
	    }
	 
	 
	    public int getEndRow() {
	        return endRow;
	    }
	 
	 
	    public void setEndRow(int endRow) {
	        this.endRow = endRow;
	    }
	 
	 
	    public String getHtml() {
	        return html;
	    }
	 
	 
	    public void setHtml(String html) {
	        this.html = html;
	    }
}

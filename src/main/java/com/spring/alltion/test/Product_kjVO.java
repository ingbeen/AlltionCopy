package com.spring.alltion.test;
/*
 create table product_kj(
		product_number_kj number primary key, -- 상품번호
		product_id_kj varchar2(1000) references member(member_id) not null , -- 아이디      
		product_subject_kj varchar2(1000) not null, -- 상품제목       
        product_delivery_kj varchar2(1000), -- 택배거래(비용) : before = 착불, after = 착불, none = 불가능
		product_transaction_area_kj varchar2(1000), -- 거래가능지역 : none = 불가능, 사용자입력값        
        product_purchase_price_kj number not null, -- 즉시구매가격  
		product_current_price_kj number not null -- 경매현재가
);

CREATE TABLE product_kj_trading (
    trading_product_number number primary key references product_kj(product_number) not null, -- 상품번호
    trading_buyer_id varchar2(1000) references member(member_id) not null, -- 구매자아이디
    trading_price number not null, -- 거래가격
    
    trading_deposit_deadline date not null, -- 입금기한
    trading_waybill_deadline date, -- 운송장번호입력기한
    trading_purchase_deadline date, -- 구매확정기한
    trading_purchase_date date, -- 구매확정일
    
    trading_transaction_method varchar2(1000) null, -- 거래방식
    
    sample4_postcode varchar2(1000) null, -- 우편번호
    sample4_roadaddress varchar2(1000) null, -- 도로명주소
    sample4_jibunaddress varchar2(1000) null, -- 지번주소
    sample4_detailaddress varchar2(1000) null, -- 상세주소
    trading_phone varchar2(1000) not null, -- 연락처
    trading_waybill_number varchar2(1000) not null, -- 운송장번호
    
    trading_progress varchar2(1000), -- 진행상태
    trading_date date not null -- 등록일
    );
    
 */
public class Product_kjVO {
	 
	 int product_number; 
	 String product_id;	 
	 String product_subject;
	 String product_delivery;
	 String product_transaction_area;
	 int product_purchase_price;
	 int product_current_price;
	 
	 int trading_price;
	 int trading_product_number;
	 String trading_buyer_id;	 
	 String trading_deposit_deadline;
	 String trading_transaction_method;
	 String trading_waybill_deadline;
	 String trading_progress;
	 
	 String trading_purchase_date;
	 
	 String trading_sample4_postcode;
	 String trading_sample4_roadAddress;
	 String trading_sample4_jibunAddress;
	 String trading_sample4_detailAddress;
	 
	 String sample4_postcode;
	 String sample4_roadAddress;
	 String sample4_jibunAddress;
	 String sample4_detailAddress;
	 
	 String member_name;
	 String member_phone;
	 
	 String trading_waybill_number;
	 
	 int emoney;
	 
	 public String getTrading_purchase_date() {
		return trading_purchase_date;
	}
	public void setTrading_purchase_date(String trading_purchase_date) {
		this.trading_purchase_date = trading_purchase_date;
	}
	public int getEmoney() {
		return emoney;
	}
	public void setEmoney(int emoney) {
		this.emoney = emoney;
	}
	public int getTrading_product_number() {
		return trading_product_number;
	}
	public void setTrading_product_number(int trading_product_number) {
		this.trading_product_number = trading_product_number;
	}
	public int getTrading_price() {
			return trading_price;
	}
	public void setTrading_price(int trading_price) {
		this.trading_price = trading_price;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}	
	public String getTrading_sample4_postcode() {
		return trading_sample4_postcode;
	}
	public void setTrading_sample4_postcode(String trading_sample4_postcode) {
		this.trading_sample4_postcode = trading_sample4_postcode;
	}
	public String getTrading_sample4_roadAddress() {
		return trading_sample4_roadAddress;
	}
	public void setTrading_sample4_roadAddress(String trading_sample4_roadAddress) {
		this.trading_sample4_roadAddress = trading_sample4_roadAddress;
	}
	public String getTrading_sample4_jibunAddress() {
		return trading_sample4_jibunAddress;
	}
	public void setTrading_sample4_jibunAddress(String trading_sample4_jibunAddress) {
		this.trading_sample4_jibunAddress = trading_sample4_jibunAddress;
	}
	public String getTrading_sample4_detailAddress() {
		return trading_sample4_detailAddress;
	}
	public void setTrading_sample4_detailAddress(String trading_sample4_detailAddress) {
		this.trading_sample4_detailAddress = trading_sample4_detailAddress;
	}
	public String getTrading_waybill_deadline() {
		return trading_waybill_deadline;
	}
	public void setTrading_waybill_deadline(String trading_waybill_deadline) {
		this.trading_waybill_deadline = trading_waybill_deadline;
	} 	 	
	 public String getTrading_deposit_deadline() {
		return trading_deposit_deadline;
	}
	public void setTrading_deposit_deadline(String trading_deposit_deadline) {
		this.trading_deposit_deadline = trading_deposit_deadline;
	}
	public String getTrading_transaction_method() {
		return trading_transaction_method;
	}
	public void setTrading_transaction_method(String trading_transaction_method) {
		this.trading_transaction_method = trading_transaction_method;
	}
	public int getProduct_number() {
		return product_number;
	}
	public void setProduct_number(int product_number) {
		this.product_number = product_number;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_subject() {
		return product_subject;
	}
	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
	}
	public String getProduct_delivery() {
		return product_delivery;
	}
	public void setProduct_delivery(String product_delivery) {
		this.product_delivery = product_delivery;
	}
	public String getProduct_transaction_area() {
		return product_transaction_area;
	}
	public void setProduct_transaction_area(String product_transaction_area) {
		this.product_transaction_area = product_transaction_area;
	}
	public int getProduct_purchase_price() {
		return product_purchase_price;
	}
	public void setProduct_purchase_price(int product_purchase_price) {
		this.product_purchase_price = product_purchase_price;
	}
	public int getProduct_current_price() {
		return product_current_price;
	}
	public void setProduct_current_price(int product_current_price) {
		this.product_current_price = product_current_price;
	}
	public String getSample4_postcode() {
		return sample4_postcode;
	}
	public void setSample4_postcode(String sample4_postcode) {
		this.sample4_postcode = sample4_postcode;
	}
	public String getSample4_roadAddress() {
		return sample4_roadAddress;
	}
	public void setSample4_roadAddress(String sample4_roadAddress) {
		this.sample4_roadAddress = sample4_roadAddress;
	}
	public String getSample4_jibunAddress() {
		return sample4_jibunAddress;
	}
	public void setSample4_jibunAddress(String sample4_jibunAddress) {
		this.sample4_jibunAddress = sample4_jibunAddress;
	}
	public String getSample4_detailAddress() {
		return sample4_detailAddress;
	}
	public void setSample4_detailAddress(String sample4_detailAddress) {
		this.sample4_detailAddress = sample4_detailAddress;
	}
	public String getTrading_waybill_number() {
		return trading_waybill_number;
	}
	public void setTrading_waybill_number(String trading_waybill_number) {
		this.trading_waybill_number = trading_waybill_number;
	}
	public String getTrading_progress() {
		return trading_progress;
	}
	public void setTrading_progress(String trading_progress) {
		this.trading_progress = trading_progress;
	}
	public String getTrading_buyer_id() {
		return trading_buyer_id;
	}
	public void setTrading_buyer_id(String trading_buyer_id) {
		this.trading_buyer_id = trading_buyer_id;
	}
	
}

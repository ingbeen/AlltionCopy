<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.spring.alltion.login.MemberVO" %>
<%
	MemberVO membervo = (MemberVO)request.getAttribute("membervo");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/css/update.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>Alltion ȸ�� ���� ����</title>
    
<!-- �ּ� api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
//�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

            // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
            var roadAddr = data.roadAddress; // ���θ� �ּ� ����
            var extraRoadAddr = ''; // ���� �׸� ����

            // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
            // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
            if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
         

            var guideTextBox = document.getElementById("guide");
            // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
<script>
function modal_display() {
  
        var member_update_modal = document.getElementById('member_update_modal');
        var close0 = document.getElementsByClassName('close')[0];
        member_update_modal.style.display = "block";
        close0.onclick = function(event) {
        	member_update_modal.style.display = "none";
        }


    // �����â �ܺ� Ŭ���� ���â �ݾ���.
    window.onclick = function(event) {
        if (event.target == member_update_modal) {
        	member_update_modal.style.display = "none";
        }
        if (event.target == bid_notify_modal) {
            bid_notify_modal.style.display = "none";
        }
    }
}
</script>  
 
<script>
function checkpassword() {
	
	var pwd1 = $("#member_password").val();
    var pwd2 = $("#member_password2").val();
    
    if ( pwd1 != '' && pwd2 == '' ) {
        null;
    } else if (pwd1 != "" || pwd2 != "") {
        if (pwd1 == pwd2) {
            $("#alert-success1").css('display', 'inline-block');
            $("#alert-danger1").css('display', 'none');
        } else {
            
            $("#alert-success1").css('display', 'none');
            $("#alert-danger1").css('display', 'inline-block');
            document.getElementsClassName("base_btn").disabled = true;
        }
    }
}
</script>


</head>

<body>
    <!-- ��� ������ ���� ���� by �ϳ�  -->
    <!-- top Ű -->
    <div id="topKey" class="topKey_btn" >
        <p class="material-icons">
            keyboard_arrow_up
    </div>
    <!-- ��� -->
    <div class="header">
        <div class="upper_header">
             <div class="upper_header--nav">
                <span>
                    <a href="" id="clock"></a>
                </span>
                <ul>
                     <li>
                        <a href="./mypage.kj">${userId}</a>
                    </li>
                     <li>
                        <a href="./logout.kj">�α׾ƿ�</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="lower_header">
            <div class="lower_header--nav">
                <h1 class="logo">
                    <a href="#">ALL-TION</a>
                </h1>
                <div class="category">
                    <a class="category--drop">
                        <img src="./resources/img/header/category_tab.png">
                    </a>
                </div>
                <div class="search">
                    <select class="search--select">
                        <option value="">��ü</option>
                        <option value="�м�">�м�</option>
                        <option value="��Ƽ">��Ƽ</option>
                        <option value="���/���Ƶ�">���/���Ƶ�</option>
                        <option value="���ڱ��">���ڱ��</option>
                        <option value="������ǰ">������ǰ</option>
                        <option value="����/���׸���">����/���׸���</option>
                        <option value="�ݷ�����/���">�ݷ�����/���</option>
                        <option value="����/����/����">����/����/����</option>
                        <option value="Ƽ��/����">Ƽ��/����</option>
                        <option value="������">������</option>
                        <option value="����/�����ǰ">����/�����ǰ</option>
                        <option value="��Ÿ��ȭ">��Ÿ��ȭ</option>
                    </select>
                    <input type="text" placeholder="ã���ô� ��ǰ�� �Է��� �ּ���" class="search__input">
                </div>
                <ul class="member_info">
                    <li>
                        <a href="./mypage.kj">
                            <span class="material-icons">perm_identity</span>
                            <span>���� ������</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="material-icons">turned_in_not</span>
                            <span>�� ���</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class="material-icons">access_time</span>
                            <span>���� ���</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- ȸ�� ���� ���� -->
        <div class="member_update--form">
            <h3>ȸ�� ���� ����</h3>
            <div class="member_update--content">
                <ul class="update_form list">
                    <li>
                        <div class="update_form__list title">
                            <span>���̵�</span>
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getMember_id() %></span>
                        </div>
                    </li>
                    <li>
                        <div class="update_form__list title">
                            <span>�̸�</span>
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getMember_name() %></span>
                        </div>
                    </li>
                    <form name = "updatePassword" action="./updatePassword.kj" method="post">
                    <ul>
                    <li>
                        <div class="update_form__list title">
                            <span>��й�ȣ ����</span>
                        </div>
                        <div class="update_form__list content">
                            <input type="password" id="member_password" name = "member_password" class= "int"><br>
                            <input type="password" id="member_password2"  name = "member_password2" class = "int" onchange="checkpassword()">
                            <span id="alert-success1" style="display: none; color: #1ec700;">��й�ȣ�� ��ġ�մϴ�.</span>
    						<span id="alert-danger1" style="display: none; color: #d92742; font-weight: bold; ">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>
                            <button type = "submit" class="update_btn pw" >�����ϱ�</button>
                        </div>
                    </li>  
                    </ul>
                    </form>                  
                    <form name="updateEmail" action="./updateEmail.kj" method="post">
                    <ul>
                    <li>
                        <div class="update_form__list title">
                            <span>�̸���</span>
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getEmail() %></span>&nbsp;&nbsp;&nbsp;
                            	<input type ="button" onclick = "modal_display()"  value = "�̸��� ����">                         
                            		<div id="member_update_modal" class="modal_email">
                               		 <div class="modal-content">
                                   		 <span class="close">&times;</span>
                                    		<fieldset id="member_update">
                                       		 <legend>�̸��� ����</legend>
                                        		<ul>
                                            		<li>
                                                	 <label>�̸���&nbsp;&nbsp;:&nbsp;</label>
                                                  <input type="text"  id="email"  name ="email" style="ime-mode:inactive; width:356px;" placeholder="������ �̸����� �Է��ϼ���." >     
				                                  <a href="javascript:updateEmail.submit()">�̸��� ����</a>&nbsp;&nbsp;
                                            </li>   
                                        </ul>
                                   </fieldset>
                                </div>
                            </div>	
            				</div> 
            			</li>
            			</ul>
            			</form>	
            			<form name = "updatePhone" action = "./updatePhone.kj" method = "post">
                    	<ul>
                    	<li>                   	
                        <div class="update_form__list title">
                            <span>�޴� ��ȭ ��ȣ</span>
                        </div>
                        <div class="update_form__list content">
                           <span><%=membervo.getMember_phone() %></span>&nbsp;&nbsp;&nbsp;                
                           <span>'-' ���� �Է��� �ּ���"</span>&nbsp;&nbsp;&nbsp;
                           <input type ="button" onclick = "modal_display()" value = "�޴���ȭ ����"> 
                           <div id="member_update_modal" class="modal_phone">
                           	<div class="modal-content1">
                                   		 <span class="close">&times;</span>
                                    		<fieldset id="member_update">
                                       		 <legend>�޴���ȭ ����</legend>
                                        		<ul>
                                            		<li>
                                                	 <label>�޴���ȭ&nbsp;&nbsp;:&nbsp;</label>
                                                  <input type="text"  id="member_phone"  name ="member_phone"  placeholder="�޴���ȭ�� �Է��ϼ���." >     
				                                  <a href="javascript:updatePhone.submit()">�޴���ȭ ����</a>&nbsp;&nbsp;
                                            </li>   
                                        </ul>
                                   </fieldset>
                                </div>
                        </div>                        
                    </li>
                    </ul>
                    </form>
                    <li>
                        <div class="update_form__list title">
                            <p class = "join_title" text-align = "left">�ּ�</span>
                        </div>
                        <div class="update_form__list content">
                            <span><%=membervo.getSample4_postcode() %></span><br>
                            <span><%=membervo.getSample4_roadAddress() %>&nbsp;
								  <%=membervo.getSample4_jibunAddress() %>&nbsp;                            
	                              <%=membervo.getSample4_detailAddress() %>&nbsp;&nbsp;
                            </span>
                            
                            <button class="update_btn">�����ϱ�</button>
                            <!--  
                            <div>
                                <input type="text" id="sample4_postcode" class = "int" name="sample4_postcode" placeholder="�����ȣ">
                                <input type="button" class = "base_btn address" onclick="sample4_execDaumPostcode()" value="�˻�"><br>
                                <input type="text" class="int" id="sample4_roadAddress" name = "sample4_roadAddress" placeholder="���θ� �ּ�">
                                <input type="text" class="int" id="sample4_jibunAddress" name = "sample4_jibunAddress" placeholder="���� �ּ�"><br>
                                <span id="guide" style="color:#999;display:none;"></span><br>
                                <input type="text" class="int" id="sample4_detailAddress" name = "sample4_detailAddress" placeholder="�� �ּҸ� �Է��� �ּ���">
                            </div>
                            -->
                        </div>
                    </li>
                </ul>
            </div>
            <div class="member_update--btn">
               	 <button class="update_btn__submit" onclick="history.back()">�ڷ� ����</button>
            </div>
        </div>
    
    <!-- Ǫ�� ���� -->
    <div class="footer">
        <div class="upper_footer">
            <ul class="upper_footer--list">
                <li>
                    <a href="#">
                        �üǼҰ�
                    </a>
                </li>
                <li>
                    <a href="#">
                        ä������
                    </a>
                </li>
                <li>
                    <a href="#">
                        ��������
                    </a>
                </li>
                <li>
                    <a href="#">
                        �̿���
                    </a>
                </li>
                <li>
                    <a href="#">
                        ��������ó����ħ
                    </a>
                </li>
                <li>
                    <a href="#">
                        ���ڱ����ŷ����
                    </a>
                </li>
                <li>
                    <a href="#">
                        ���޼���
                    </a>
                </li>
            </ul>
        </div>
        <div class="lower_footer">
        </div>        
    </div>
    
    <!--  ��ũ��Ʈ ����  -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    <script src="./resources/js/update.js"></script>
</body>
</html>
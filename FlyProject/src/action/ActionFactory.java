package action;

import controller.KAKAO_Check;
import controller.Login_Action;
import controller.Logout_Action;
import controller.UserJoin_Action;
import controller.UserUpdateF_Action;
import controller.UserUpdateP_Action;
import controller.UserUpdateV_Action;
import controller.idCheck_Action;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String comand){
		if(comand == null){
			return null;
		}else if(comand.equals("login")){
			return new Login_Action();
		}else if(comand.equals("join")) {
			return new UserJoin_Action();
		}else if(comand.equals("update_form")) {
			return new UserUpdateF_Action();
		}else if(comand.equals("update_proc")) {
			return new UserUpdateP_Action();
		}else if(comand.equals("idcheck")) {
			return new idCheck_Action();
		}else if(comand.equals("logout")) {
			return new Logout_Action();
		}else if(comand.equals("kakao_login")) {
			return new KAKAO_Check();
		
		}else if(comand.equals("view_form")) {
			return new UserUpdateV_Action();
		}
		
		return null;
	}
}

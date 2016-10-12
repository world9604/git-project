package singleton;

public class Singleton {

	private static Singleton INSTANCE;
	
	public static Singleton getInstance(){
		if(INSTANCE == null){
			INSTANCE = new Singleton();
		}
		
		return INSTANCE;
	}
	
	public void singletonMethod(){
		//여기서 연산을 수행함
	}
}

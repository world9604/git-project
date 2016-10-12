package builder;

import static org.junit.Assert.*;

import org.junit.Test;

public class legalBuild {

	@Test
	public void test() {
		final Pet.Builder builder = new Pet.Builder();
		final Pet pet = builder.withAnimal(Animal.CAT)
				.withPetName("Squidge")
				.withOwnerName("Simon Smith")
				.withAddress("123121312")
				.withTelephone("010-123131")
				.withEmailAddress("world@naver,com")
				.build();
		
	}
	
	@Test(expected=IllegalStateException.class)
	public void illegalBuilder(){
		final Pet.Builder builder = new Pet.Builder();
		final Pet pet = builder
				.withAnimal(Animal.DOG)
				.withPetName("asdfad")
				.withOwnerName("asdfasfa")
				.build();
	}

}

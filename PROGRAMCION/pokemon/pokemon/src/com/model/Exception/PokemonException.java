package com.model.Exception;

public class PokemonException extends Exception {

	private static final String DEFAULT_MESSAGE = "Pokemon ya introducido en la pokedex no puedes crear otro";
	
	public PokemonException() {
		super(DEFAULT_MESSAGE);
	}

	public PokemonException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public PokemonException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	public PokemonException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public PokemonException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

}

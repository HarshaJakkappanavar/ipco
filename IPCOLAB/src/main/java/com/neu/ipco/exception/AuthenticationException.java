/**
 * 
 */
package com.neu.ipco.exception;

/**
 * @author Harsha
 *
 */
public class AuthenticationException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6973648837798486041L;

	/**
	 * 
	 */
	public AuthenticationException() {
	}

	/**
	 * @param arg0
	 */
	public AuthenticationException(String arg0) {
		super(arg0);
	}

	/**
	 * @param arg0
	 */
	public AuthenticationException(Throwable arg0) {
		super(arg0);
	}

	/**
	 * @param arg0
	 * @param arg1
	 */
	public AuthenticationException(String arg0, Throwable arg1) {
		super(arg0, arg1);
	}

	/**
	 * @param arg0
	 * @param arg1
	 * @param arg2
	 * @param arg3
	 */
	public AuthenticationException(String arg0, Throwable arg1, boolean arg2, boolean arg3) {
		super(arg0, arg1, arg2, arg3);
	}

}

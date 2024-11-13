package com.yash.ngodonation.exception;

public class UserBlockedException extends Exception{

    /**
     * creates user object with and without description
     */
    public UserBlockedException() {}
    public UserBlockedException(String errDesc) {
        super(errDesc);
    }
}

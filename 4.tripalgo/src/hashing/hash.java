package hashing;

import java.security.NoSuchAlgorithmException;

public interface hash {
	public String encrypt(String text) throws NoSuchAlgorithmException;
	String bytesToHex(byte[] bytes);
}

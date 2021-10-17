package es.golemdr.prefieromizona.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.time.ZonedDateTime;
import java.util.Base64;

import javax.imageio.ImageIO;

import org.apache.commons.codec.digest.DigestUtils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeWriter;

public final class QRCodeUtils {

	private static final Charset CHARSET = StandardCharsets.UTF_8;
	private static final String IMG_FORMAT = "png";
	private static final int WIDTH = 500;
	private static final int HEIGHT = 500;

	private QRCodeUtils() {}

	public static void generateQRCode(String data)
			throws WriterException, IOException {
		
		String contents = new String(data.getBytes(CHARSET), CHARSET);
		String path = getHashFromActualTime() + "." + IMG_FORMAT;
		
		BitMatrix bitMatrix = new QRCodeWriter().encode(contents, BarcodeFormat.QR_CODE, WIDTH, HEIGHT);
		FileOutputStream outputStream = new FileOutputStream(new File(path));
		MatrixToImageWriter.writeToStream(bitMatrix, IMG_FORMAT, outputStream);		
	}

	public static String generateQRCodeBase64(String data)
			throws WriterException, IOException {
		
		String qrBase64 = null;
		
		String contents = new String(data.getBytes(CHARSET), CHARSET);
		
		BitMatrix bitMatrix = new QRCodeWriter().encode(contents, BarcodeFormat.QR_CODE, WIDTH, HEIGHT);

		ByteArrayOutputStream os = new ByteArrayOutputStream();
		
		BufferedImage buffImg =  MatrixToImageWriter.toBufferedImage(bitMatrix);


	    ImageIO.write(buffImg, IMG_FORMAT, os);
	    qrBase64=  Base64.getEncoder().encodeToString(os.toByteArray());
		
		return qrBase64;
	}

	public static String readQRcode(String fileName)
			throws IOException, NotFoundException {
		
		String path = fileName + "." + IMG_FORMAT;
		BinaryBitmap binaryBitmap = new BinaryBitmap(
				new HybridBinarizer(new BufferedImageLuminanceSource(ImageIO.read(new FileInputStream(path)))));
		Result result = new MultiFormatReader().decode(binaryBitmap);
		return result.getText();
	}

	private static String getHashFromActualTime() {
		String result = "";

		// Generar código alfanumérico aleatorio basado en la hora (expresada en
		// milisegundos)
		long actualTimeMilliseconds = ZonedDateTime.now().toInstant().toEpochMilli();
		String data = String.valueOf(actualTimeMilliseconds);

		result = DigestUtils.sha1Hex(data);

		return result;
	}
	

}

/* **************************************************************************************************
 * 
 * REFERENCIAS:
 * 	https://gustavopeiretti.com/java-codigos-barra-zxing/
 * 	https://www.javatpoint.com/generating-qr-code-in-java
 * 	https://www.geeksforgeeks.org/how-to-generate-and-read-qr-code-with-java-using-zxing-library/
 * 	https://stackoverflow.com/questions/25223553/how-can-i-create-an-utility-class
 * 	https://beginnersbook.com/2014/01/how-to-get-time-in-milliseconds-in-java/
 * 	https://www.baeldung.com/spring-classpath-file-access
 * 	https://www.journaldev.com/977/logger-in-java-logging-example
 * 
 * */

package util;

public class CommonUtil {

    public static void close(AutoCloseable closeable) {
        if (closeable == null) {
            return;
        }
        
        try {
            closeable.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
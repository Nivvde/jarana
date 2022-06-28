package com.jlcit.jarana;

import io.minio.BucketExistsArgs;
import io.minio.GetObjectArgs;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.io.FileInputStream;

public class MinioTest {

    private static MinioClient minioClient;
    private static final String BUCKET = "test";

    @BeforeAll
    public static void before(){
        minioClient =
                MinioClient.builder()
                        .endpoint("http://127.0.0.1:9000")
                        .credentials("niv", "nivpassword")
                        .build();
    }

    @Test
    public void connectionTest() throws Exception{
        boolean foundTestBucket =
                minioClient.bucketExists(BucketExistsArgs.builder().bucket(BUCKET).build());
        Assertions.assertEquals(true, foundTestBucket);
    }

    @Test
    public void uploadObjectTEst() throws Exception {
        var imgPath = "C:\\Users\\inpan\\Downloads\\jalance_portada.jpg";
        var file = new File(imgPath);
        minioClient.putObject(
                PutObjectArgs.builder().bucket(BUCKET).object("test.jpg").stream(
                                new FileInputStream(file), -1, 10485760)
                        .contentType("image/jpeg")
                        .build());
        minioClient.getObject(GetObjectArgs.builder().bucket(BUCKET).object("test.jpg").build());
    }
}

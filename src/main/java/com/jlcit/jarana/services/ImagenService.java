package com.jlcit.jarana.services;

import com.jlcit.jarana.entities.Imagen;
import com.jlcit.jarana.repositories.ImagenRepository;
import io.minio.GetObjectArgs;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import org.apache.commons.compress.utils.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.PostConstruct;
import java.io.InputStream;

@Service
public class ImagenService {

    @Value("${minio.endpoint}")
    private String endpoint;

    @Value("${minio.access.key}")
    private String accessKey;

    @Value("${minio.secret.key}")
    private String secretKey;

    @Value("${minio.bucket}")
    private String bucket;

    private static MinioClient minioClient;

    @PostConstruct
    private void init(){
        minioClient =
                MinioClient.builder()
                        .endpoint(endpoint)
                        .credentials(accessKey, secretKey)
                        .build();
    }

    private final ImagenRepository repository;

    ImagenService(ImagenRepository repository){
        this.repository = repository;
    }

    public Imagen uploadImage(final String objectName, final InputStream is, final String contentType) throws Exception{
        var uploadedObject = minioClient.putObject(
                PutObjectArgs.builder().bucket(bucket).object(objectName).stream(
                                is, -1, 10485760)
                        .contentType(contentType)
                        .build());
        return repository.save(Imagen.builder().url(uploadedObject.object()).build());
    }

    public ResponseEntity<byte[]> downloadImage(final String objectName) throws Exception{
        var object = minioClient.getObject(
                GetObjectArgs.builder().bucket(bucket).object(objectName).build());
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_TYPE, object.headers().get(HttpHeaders.CONTENT_TYPE))
                .body(object.readAllBytes());
    }
}

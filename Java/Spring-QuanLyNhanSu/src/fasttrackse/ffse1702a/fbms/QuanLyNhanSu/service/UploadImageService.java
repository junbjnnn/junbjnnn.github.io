package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service;

import java.io.IOException;

import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

public interface UploadImageService {

	public void uploadImage(String filename, MultipartFile image) throws RuntimeException, IOException;

	public String checkImage(MultipartFile image, BindingResult bindingResult);
}

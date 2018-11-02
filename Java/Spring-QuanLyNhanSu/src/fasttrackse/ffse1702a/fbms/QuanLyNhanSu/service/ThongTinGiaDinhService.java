package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service;

import java.util.List;

import org.springframework.validation.BindingResult;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ThongTinGiaDinh;

public interface ThongTinGiaDinhService {
	public void addThongTinGiaDinh(ThongTinGiaDinh ttgd);

	public void updateThongTinGiaDinh(ThongTinGiaDinh ttgd);

	public void deleteThongTinGiaDinh(int id);

	public List<String> getErrorList(BindingResult bindingResult);

	public List<String> getDeleteList(List<ThongTinGiaDinh> listThongTinGiaDinh);

}

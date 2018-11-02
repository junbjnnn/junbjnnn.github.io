package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service;

import java.util.List;

import org.springframework.validation.BindingResult;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ThongTinBangCap;

public interface ThongTinBangCapService {
	public void addThongTinBangCap(ThongTinBangCap ttbc);
	public void updateThongTinBangCap(ThongTinBangCap ttbc);
	public void deleteThongTinBangCap(int id);
	public List<String> getDeleteList(List<ThongTinBangCap> listThongTinBangcap);
	public List<String> getErrorList(BindingResult bindingResult) ;

}

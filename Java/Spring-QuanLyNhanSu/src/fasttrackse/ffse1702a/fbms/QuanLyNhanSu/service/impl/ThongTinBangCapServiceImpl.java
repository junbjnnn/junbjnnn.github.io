package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.ThongTinBangCapDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ThongTinBangCap;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.ThongTinBangCapService;

@Service
public class ThongTinBangCapServiceImpl implements ThongTinBangCapService {
	@Autowired
	private ThongTinBangCapDAO thongTinBangCapDAO;

	@Override
	@Transactional
	public void addThongTinBangCap(ThongTinBangCap ttbc) {
		this.thongTinBangCapDAO.addThongTinBangCap(ttbc);
	}

	@Override
	@Transactional
	public void updateThongTinBangCap(ThongTinBangCap ttbc) {
		this.thongTinBangCapDAO.updateThongTinBangCap(ttbc);
	}

	@Override
	@Transactional
	public void deleteThongTinBangCap(int id) {
		this.thongTinBangCapDAO.deleteThongTinBangCap(id);
	}
	
	@Override
	@Transactional
	public List<String> getErrorList(BindingResult bindingResult) {
		List<String> errorList = new ArrayList<String>();

		List<ObjectError> errors = bindingResult.getAllErrors();
		for (ObjectError error : errors) {
			String[] errorCodes = error.getCodes();
			String n = errorCodes[0].replaceFirst(".*?(\\d+).*", "$1");
			if (!errorList.contains(n)) {
				errorList.add(n);
			}
		}
		return errorList;
	}

	@Override
	@Transactional
	public List<String> getDeleteList(List<ThongTinBangCap> listThongTinBangcap) {
		List<String> deleteList = new ArrayList<String>();

		int size = listThongTinBangcap.size();
		for (int i = 0; i < size; i++) {
			int id = listThongTinBangcap.get(i).getId();
			if (id < 0) {
				deleteList.add(String.valueOf(i));
			}
		}
		return deleteList;
	}

}

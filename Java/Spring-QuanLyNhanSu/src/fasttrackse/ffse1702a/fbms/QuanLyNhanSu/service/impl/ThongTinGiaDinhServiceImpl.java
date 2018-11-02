package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.ThongTinGiaDinhDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.ThongTinGiaDinh;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.ThongTinGiaDinhService;

@Service
public class ThongTinGiaDinhServiceImpl implements ThongTinGiaDinhService {
	@Autowired
	private ThongTinGiaDinhDAO thongTinGiaDinhDAO;

	@Override
	@Transactional
	public void addThongTinGiaDinh(ThongTinGiaDinh ttgd) {
		this.thongTinGiaDinhDAO.addThongTinGiaDinh(ttgd);
	}

	@Override
	@Transactional
	public void updateThongTinGiaDinh(ThongTinGiaDinh ttgd) {
		this.thongTinGiaDinhDAO.updateThongTinGiaDinh(ttgd);
	}

	@Override
	@Transactional
	public void deleteThongTinGiaDinh(int id) {
		this.thongTinGiaDinhDAO.deleteThongTinGiaDinh(id);
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
	public List<String> getDeleteList(List<ThongTinGiaDinh> listThongTinGiaDinh) {
		List<String> deleteList = new ArrayList<String>();

		int size = listThongTinGiaDinh.size();
		for (int i = 0; i < size; i++) {
			int id = listThongTinGiaDinh.get(i).getId();
			if (id < 0) {
				deleteList.add(String.valueOf(i));
			}
		}
		return deleteList;
	}

}

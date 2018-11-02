package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity;

import java.util.List;

import javax.validation.Valid;

public class ThongTinGiaDinhForm {
	@Valid
	private List<ThongTinGiaDinh> listThongTinGiaDinh;

	public ThongTinGiaDinhForm(List<ThongTinGiaDinh> listThongTinGiaDinh) {
		super();
		this.listThongTinGiaDinh = listThongTinGiaDinh;
	}

	public List<ThongTinGiaDinh> getListThongTinGiaDinh() {
		return listThongTinGiaDinh;
	}

	public void setListThongTinGiaDinh(List<ThongTinGiaDinh> listThongTinGiaDinh) {
		this.listThongTinGiaDinh = listThongTinGiaDinh;
	}

}

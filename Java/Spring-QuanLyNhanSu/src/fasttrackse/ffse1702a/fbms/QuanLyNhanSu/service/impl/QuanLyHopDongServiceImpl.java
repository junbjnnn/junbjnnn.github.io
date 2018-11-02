package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.QuanLyHopDongDAO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HopDong;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.DatatableService;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.QuanLyHopDongService;

@Service
public class QuanLyHopDongServiceImpl implements QuanLyHopDongService {
	@Autowired
	private QuanLyHopDongDAO quanLyHopDongDAO;
	@Autowired
	private DatatableService datatableService;

	@Override
	@Transactional
	public List<HopDong> getAllHopDong() {
		return this.quanLyHopDongDAO.getAllHopDong();
	}

	@Override
	@Transactional
	public List<HopDong> getHopDongByPhongBan(String maPhongBan) {
		return this.quanLyHopDongDAO.getHopDongByPhongBan(maPhongBan);
	}

	@Override
	@Transactional
	public void addHopDong(HopDong tthd) {
		this.quanLyHopDongDAO.addHopDong(tthd);
	}

	@Override
	@Transactional
	public void updateHopDong(HopDong tthd) {
		this.quanLyHopDongDAO.updateHopDong(tthd);
	}

	@Override
	@Transactional
	public String getAutoId() {
		return this.quanLyHopDongDAO.getAutoId();
	}

	@Override
	@Transactional
	public String getRecordsTotal(String maPhongBan) {
		return this.quanLyHopDongDAO.getRecordsTotal(maPhongBan);
	}

	@Override
	@Transactional
	public String getRecordsFiltered(String sql) {
		return this.quanLyHopDongDAO.getRecordsFiltered(sql);
	}

	@Override
	@Transactional
	public String getSQL(HttpServletRequest request, String maPhongBan) {
		String selectQuery = "select hd from HopDong hd inner join hd.hoSoNhanVien ";
		String[] columnNames = { "hd.hoSoNhanVien.maNhanVien", "hd.hoSoNhanVien.hoDem", "hd.hoSoNhanVien.ten",
				"hd.loaiHopDong.tenHopDong", "hd.ngayKyKet", "hd.ngayKetThuc", "hd.trangThai" };
		String customCondition = maPhongBan.equals("ns") ? ""
				: ("hd.hoSoNhanVien.phongBan.maPhongBan = '" + maPhongBan + "' and hd.trangThai = 1");

		String sql = this.datatableService.getSqlQuery(selectQuery, request, columnNames, customCondition);

		return sql;
	}

	@Override
	@Transactional
	public List<HopDong> getAllHopDong(int iDisplayStart, int iDisplayLength, String sql) {

		return this.quanLyHopDongDAO.getAllHopDong(iDisplayStart, iDisplayLength, sql);
	}

	@Override
	@Transactional
	public String toJson(HopDong hd) {
		HoSoNhanVien hsnv = hd.getHoSoNhanVien();
		String maNhanVien = String.format("%05d", hsnv.getMaNhanVien());
		String hoDem = hsnv.getHoDem();
		String ten = hsnv.getTen();
		String tenHopDong = hd.getLoaiHopDong().getTenHopDong();
		String ngayKyKet = hd.getNgayKyKet().toString();
		String ngayKetThuc = hd.getNgayKetThuc().toString();
		String trangThai = hd.getTrangThai() == 1 ? "Còn hợp đồng" : "Hết hợp đồng";
		String action = "<a href='/ffse-fbms/qlns/" + hsnv.getPhongBan().getMaPhongBan() + "/view/hop_dong/"
				+ hsnv.getMaNhanVien() + "'><i class='fa fa-eye'></i></a>" + "<a href='/ffse-fbms/qlns/hop_dong/edit/"
				+ hsnv.getMaNhanVien() + "'><i class='fa fa-pencil'></i></a>";

		return "[\"" + maNhanVien + "\",\"" + hoDem + "\",\"" + ten + "\",\"" + tenHopDong + "\",\"" + ngayKyKet
				+ "\",\"" + ngayKetThuc + "\",\"" + trangThai + "\",\"" + action + "\"]";
	}
}
package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;

public interface QuanLyHoSoService {

	public HoSoNhanVien getHoSoNhanVienById(int maNhanVien);

	public String getRecordsTotal(String maPhongBan);

	public String getRecordsFiltered(String sql);

	public String getSQL(HttpServletRequest request, String maPhongBan);

	public List<HoSoNhanVien> getAllHoSo();

	public List<HoSoNhanVien> getAllHoSo(int iDisplayStart, int iDisplayLength, String sql);

	public List<HoSoNhanVien> getHoSoByPhongBan(String maPhongBan);

	public void addHoSoNhanVien(HoSoNhanVien hsnv);

	public void updateHoSoNhanVien(HoSoNhanVien hsnv);

	public void deleteHoSoNhanVien(int maNhanVien);

	public String getAutoId();

	public String toJson(HoSoNhanVien hsnv);

}

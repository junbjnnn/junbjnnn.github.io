package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao;

import java.util.List;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;

public interface QuanLyHoSoDAO {

	public HoSoNhanVien getHoSoNhanVienById(int maNhanVien);

	public String getRecordsTotal(String maPhongBan);

	public String getRecordsFiltered(String sql);

	public List<HoSoNhanVien> getAllHoSo();

	public List<HoSoNhanVien> getAllHoSo(int iDisplayStart, int iDisplayLength, String sql);

	public List<HoSoNhanVien> getHoSoByPhongBan(String maPhongBan);

	public void addHoSoNhanVien(HoSoNhanVien hsnv);

	public void updateHoSoNhanVien(HoSoNhanVien hsnv);

	public void deleteHoSoNhanVien(int maNhanVien);

	public String getAutoId();

}

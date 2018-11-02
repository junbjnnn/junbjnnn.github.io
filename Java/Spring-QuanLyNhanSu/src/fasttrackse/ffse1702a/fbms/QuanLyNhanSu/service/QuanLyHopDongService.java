package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HopDong;

public interface QuanLyHopDongService {

	public List<HopDong> getAllHopDong();

	public List<HopDong> getHopDongByPhongBan(String maPhongBan);

	public void addHopDong(HopDong tthd);

	public void updateHopDong(HopDong tthd);

	public String getAutoId();

	public String getRecordsTotal(String maPhongBan);

	public String getRecordsFiltered(String sql);

	public String getSQL(HttpServletRequest request, String maPhongBan);

	public List<HopDong> getAllHopDong(int iDisplayStart, int iDisplayLength, String sql);

	public String toJson(HopDong hd);
}

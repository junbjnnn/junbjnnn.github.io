package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HopDong;

public interface DatatableService {

	public String getSearchQuery(HttpServletRequest request, String[] columnNames, String customCondition);

	public String getSortQuery(HttpServletRequest request, String[] columnNames);

	public String getSqlQuery(String selectQuery, HttpServletRequest request, String[] columnNames,
			String customCondition);

	public String getJsonHoSo(String recordsTotal, String recordsFiltered, List<HoSoNhanVien> list);

	public String getJsonHopDong(String recordsTotal, String recordsFiltered, List<HopDong> list);
}

package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HopDong;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.DatatableService;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.QuanLyHoSoService;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.QuanLyHopDongService;

@Service
public class DatatableServiceImpl implements DatatableService {

	@Autowired
	private QuanLyHoSoService quanLyHoSoService;
	@Autowired
	private QuanLyHopDongService quanLyHopDongService;

	@Override
	public String getSearchQuery(HttpServletRequest request, String[] columnNames, String customCondition) {

		int colLength = columnNames.length;
		String sSearch = request.getParameter("sSearch");
		String globeSearch = "where " + customCondition;
		boolean existCustom = !customCondition.isEmpty();

		if (!sSearch.isEmpty()) {
			for (int i = 0; i < colLength; i++) {
				if (i == 0) {
					if (existCustom) {
						globeSearch += " and ";
					}
					globeSearch += "(" + columnNames[i] + " like '%" + sSearch + "%' ";
				} else {
					globeSearch += "or " + columnNames[i] + " like '%" + sSearch + "%' ";
				}
			}
			globeSearch += ")";
			sSearch = globeSearch;
		}

		return !existCustom ? sSearch : globeSearch;
	}

	@Override
	public String getSortQuery(HttpServletRequest request, String[] columnNames) {

		int colLength = columnNames.length;
		List<String> sortNames = new ArrayList<String>();
		List<String> sortDirections = new ArrayList<String>();

		for (int i = 0; i < colLength; i++) {
			String colIndex = request.getParameter("iSortCol_" + i);
			if (colIndex != null) {
				String sortName = columnNames[Integer.parseInt(colIndex)];
				String sortDirection = request.getParameter("sSortDir_" + i);

				sortNames.add(sortName);
				sortDirections.add(sortDirection);
			} else {
				break;
			}
		}

		int sortLength = sortNames.size();
		String sort = " order by ";
		for (int i = 0; i < sortLength; i++) {
			sort += sortNames.get(i) + " " + sortDirections.get(i);
			if (i != sortLength - 1) {
				sort += ", ";
			}
		}

		if (sortLength != 0) {
			return sort;
		}

		return null;
	}

	@Override
	@Transactional
	public String getSqlQuery(String selectQuery, HttpServletRequest request, String[] columnNames,
			String customCondition) {

		return selectQuery + getSearchQuery(request, columnNames, customCondition) + getSortQuery(request, columnNames);
	}

	@Override
	@Transactional
	public String getJsonHoSo(String recordsTotal, String recordsFiltered, List<HoSoNhanVien> list) {

		String json = "{\"recordsTotal\":" + recordsTotal + ",\"recordsFiltered\":" + recordsFiltered + ",\"aaData\":[";
		int j = list.size();
		int i = 0;
		for (HoSoNhanVien hsnv : list) {
			i++;
			if (i == j) {
				json += this.quanLyHoSoService.toJson(hsnv);
			} else {
				json += this.quanLyHoSoService.toJson(hsnv) + ",";
			}
		}
		json += "]}";

		return json;
	}

	@Override
	@Transactional
	public String getJsonHopDong(String recordsTotal, String recordsFiltered, List<HopDong> list) {

		String json = "{\"recordsTotal\":" + recordsTotal + ",\"recordsFiltered\":" + recordsFiltered + ",\"aaData\":[";
		int j = list.size();
		int i = 0;
		for (HopDong hd : list) {
			i++;
			if (i == j) {
				json += this.quanLyHopDongService.toJson(hd);
			} else {
				json += this.quanLyHopDongService.toJson(hd) + ",";
			}
		}
		json += "]}";

		return json;
	}
}

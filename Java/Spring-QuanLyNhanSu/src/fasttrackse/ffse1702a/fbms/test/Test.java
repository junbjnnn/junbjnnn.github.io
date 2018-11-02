package fasttrackse.ffse1702a.fbms.test;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.QuanLyHoSoService;

@Controller
public class Test {
	@Autowired
	private QuanLyHoSoService quanLyHoSoService;

	private String GLOBAL_SEARCH_TERM;
	private List<String> COLUMN_NAME;
	private List<String> DIRECTION;
	private int INITIAL;
	private int RECORD_SIZE;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String testList(Model model) {
		return "QuanLyNhanSu/QuanLyHoSo/testform";
	}

	@RequestMapping(value = "/testDB", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String testDB(Model model, HttpServletRequest request) {

		String[] columnNames = { "ma_nhan_vien", "anh_dai_dien", "ho_dem", "ten", "gioi_tinh", "ma_phong_ban",
				"ma_chuc_danh", "trang_thai" };
		COLUMN_NAME = new ArrayList();
		DIRECTION = new ArrayList();
		int colLength = columnNames.length;

		String pageNo = request.getParameter("iDisplayStart");
		String pageSize = request.getParameter("iDisplayLength");

		int recordsTotal = Integer.parseInt(quanLyHoSoService.getAutoId()) - 1;

		INITIAL = Integer.parseInt(pageNo);
		RECORD_SIZE = Integer.parseInt(pageSize);
		GLOBAL_SEARCH_TERM = request.getParameter("sSearch");

		String sql = "from HoSoNhanVien ";
		String globeSearch = "";
		if (!GLOBAL_SEARCH_TERM.isEmpty()) {
			for (int i = 0; i < colLength; i++) {
				if (i == 0) {
					globeSearch += "where " + columnNames[i] + " like '%" + GLOBAL_SEARCH_TERM + "%' ";
				} else {
					globeSearch += "or " + columnNames[i] + " like '%" + GLOBAL_SEARCH_TERM + "%' ";
				}
			}
			GLOBAL_SEARCH_TERM = globeSearch;
		}

		for (int i = 0; i < colLength; i++) {
			String colIndex = request.getParameter("iSortCol_" + i);
			if (colIndex != null) {
				String sortDirection = request.getParameter("sSortDir_" + i);

				COLUMN_NAME.add(columnNames[Integer.parseInt(colIndex)]);
				DIRECTION.add(sortDirection);
			} else {
				break;
			}
		}

		int sortLength = DIRECTION.size();
		String sort = " order by ";
		for (int i = 0; i < sortLength; i++) {
			sort += COLUMN_NAME.get(i) + " " + DIRECTION.get(i);
			if (i != sortLength - 1) {
				sort += ", ";
			}
			System.out.println(sort);
		}
		if (sortLength != 0) {
			sql += GLOBAL_SEARCH_TERM + sort;
		}

		System.err.println(sql);

		List<HoSoNhanVien> list = quanLyHoSoService.getAllHoSo(INITIAL, RECORD_SIZE, sql);
		String recordsFiltered = String.valueOf(list.size());

		String json = "{\"recordsTotal\":" + recordsTotal + ",\"recordsFiltered\":" + recordsFiltered + ",\"aaData\":[";
		int j = list.size();
		int i = 0;
		for (@SuppressWarnings("unused")
		HoSoNhanVien hsnv : list) {
			i++;
			if (i == j) {
				// json += hsnv.toJson();
			} else {
				// json += hsnv.toJson() + ",";
			}
		}
		json += "]}";
		System.out.println(json);
		return json;
	}
}

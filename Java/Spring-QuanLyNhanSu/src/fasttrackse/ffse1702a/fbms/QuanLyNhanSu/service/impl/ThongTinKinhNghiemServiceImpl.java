package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dao.QuanLyHoSoDAO;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.Database;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.DuAn;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.Framework;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.NgonNgu;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.ThongTinKinhNghiemService;

@Service
public class ThongTinKinhNghiemServiceImpl implements ThongTinKinhNghiemService {
	
	@Autowired
	private QuanLyHoSoDAO quanlyhosoDAO;
	
	@Override
	@Transactional
	public Map<String, Integer> listNgonNgu(int maNhanVien) {
		List<String> listNgonNgu = new ArrayList<>();
		
		HoSoNhanVien hs = this.quanlyhosoDAO.getHoSoNhanVienById(maNhanVien);
		Set<DuAn> listDuAn = hs.getDuAn();
		for(DuAn duan : listDuAn ) {
			Set<NgonNgu> ngonNgus = duan.getNgonNgu();
			for (NgonNgu nn : ngonNgus) {
				listNgonNgu.add(nn.getTenNgonNgu());
			}
		}
		Map<String, Integer> map = new HashMap<>(listNgonNgu.size());
		for (String name : listNgonNgu) {
		   Integer count = map.get(name);
		   if (count == null) {
		       count = 0;
		   }
		   map.put(name, count + 1);
		}
		return map;
	}
	
	@Override
	@Transactional
	public Map<String, Integer> listFramework(int maNhanVien) {
		List<String> listFramework = new ArrayList<>();
		
		HoSoNhanVien hs = this.quanlyhosoDAO.getHoSoNhanVienById(maNhanVien);
		Set<DuAn> listDuAn = hs.getDuAn();
		for(DuAn duan : listDuAn ) {
			Set<Framework> frameworks = duan.getFramework();
			for (Framework fr : frameworks) {
				listFramework.add(fr.getTenFramework());
			}
		}
		Map<String, Integer> map = new HashMap<>(listFramework.size());
		for (String name : listFramework) {
		   Integer count = map.get(name);
		   if (count == null) {
		       count = 0;
		   }
		   map.put(name, count + 1);
		}
		return map;
	}
	
	@Override
	@Transactional
	public Map<String, Integer> listDatabase(int maNhanVien) {
		List<String> listDatabase = new ArrayList<>();
		
		HoSoNhanVien hs = this.quanlyhosoDAO.getHoSoNhanVienById(maNhanVien);
		Set<DuAn> listDuAn = hs.getDuAn();
		for(DuAn duan : listDuAn ) {
			Set<Database> databases = duan.getDatabase();
			for (Database db : databases) {
				listDatabase.add(db.getTenDatabase());
			}
		}
		Map<String, Integer> map = new HashMap<>(listDatabase.size());
		for (String name : listDatabase) {
		   Integer count = map.get(name);
		   if (count == null) {
		       count = 0;
		   }
		   map.put(name, count + 1);
		}
		return map;
	}
}

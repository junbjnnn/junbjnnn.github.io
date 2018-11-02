package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service;

import java.util.Map;

public interface ThongTinKinhNghiemService {
	public Map<String, Integer> listNgonNgu(int maNhanVien);
	public Map<String, Integer> listFramework(int maNhanVien);
	public Map<String, Integer> listDatabase(int maNhanVien);
	
}

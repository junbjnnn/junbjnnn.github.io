package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.DuAn;
import fasttrackse.ffse1702a.fbms.QuanLyDuAn.model.entity.NhiemVu;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dto.DuAnDTO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.dto.HoSoNhanVienDTO;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.HoSoNhanVien;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.QuanLyHoSoService;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.ThongTinKinhNghiemService;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.VaiTroService;
import fasttrackse.ffse1702a.fbms.Security.model.entity.UserAccount;
import fasttrackse.ffse1702a.fbms.Security.service.UserAccountService;

@Controller
public class TatCaThongTinController {
	@Autowired
	private QuanLyHoSoService quanLyHoSoService;

	@Autowired
	private ThongTinKinhNghiemService thongTinKinhNghiemService;

	@Autowired
	private VaiTroService vaiTroService;
	@Autowired
	private UserAccountService userAccountService;

	@RequestMapping(value = "qlns/*/view/ho_so_tong_hop/{maNhanVien}", method = RequestMethod.GET)
	public String tatCaThongTin(@PathVariable("maNhanVien") int maNhanVien, Model model) {
		HoSoNhanVien hsnv = this.quanLyHoSoService.getHoSoNhanVienById(maNhanVien);

		HoSoNhanVienDTO hsnvDTO = new HoSoNhanVienDTO();
		BeanUtils.copyProperties(hsnv, hsnvDTO);

		DuAnDTO duAnDTO;
		Set<DuAnDTO> duAnDTOLts = new HashSet<DuAnDTO>();
		for (DuAn duAn : hsnv.getDuAn()) {
			duAnDTO = new DuAnDTO();
			BeanUtils.copyProperties(duAn, duAnDTO);
			duAnDTOLts.add(duAnDTO);
		}
		hsnvDTO.setDuAnDTO(duAnDTOLts);
		List<String> vaiTro;
		for (DuAnDTO duan : hsnvDTO.getDuAnDTO()) {
			List<NhiemVu> nhiemVu = vaiTroService.getNhiemVuById(maNhanVien, duan.getMaDuAn());
			vaiTro = new ArrayList<String>();
			for (NhiemVu nv : nhiemVu) {
				String getVaiTro = vaiTroService.getVaiTroById(nv.getMaVaiTro()).getTenVaiTro();
				vaiTro.add(getVaiTro);
			}
			duan.setVaiTro(vaiTro);
		}
		Map<String, Integer> ngonngu = this.thongTinKinhNghiemService.listNgonNgu(maNhanVien);
		Map<String, Integer> framework = this.thongTinKinhNghiemService.listFramework(maNhanVien);
		Map<String, Integer> database = this.thongTinKinhNghiemService.listDatabase(maNhanVien);
		model.addAttribute("listFramework", framework);
		model.addAttribute("listDatabase", database);
		model.addAttribute("listNgonNgu", ngonngu);
		model.addAttribute("hoSoNhanVien", hsnvDTO);
		return "QuanLyNhanSu/QuanLyHoSo/View/TatCaThongTinView";
	}

	@RequestMapping(value = "qlns/nv/ho_so_tong_hop", method = RequestMethod.GET)
	public String viewOneHSTongHop(HttpServletRequest request, Model model) {

		UserAccount userAccount = this.userAccountService.loadUserByUsername(request.getUserPrincipal().getName());
		int maNhanVien = userAccount.getNhanVien().getMaNhanVien();
		model.addAttribute("role_nv", "true");
		HoSoNhanVien hsnv = this.quanLyHoSoService.getHoSoNhanVienById(maNhanVien);

		HoSoNhanVienDTO hsnvDTO = new HoSoNhanVienDTO();
		BeanUtils.copyProperties(hsnv, hsnvDTO);

		DuAnDTO duAnDTO;
		Set<DuAnDTO> duAnDTOLts = new HashSet<DuAnDTO>();
		for (DuAn duAn : hsnv.getDuAn()) {
			duAnDTO = new DuAnDTO();
			BeanUtils.copyProperties(duAn, duAnDTO);
			duAnDTOLts.add(duAnDTO);
		}
		hsnvDTO.setDuAnDTO(duAnDTOLts);
		List<String> vaiTro;
		for (DuAnDTO duan : hsnvDTO.getDuAnDTO()) {
			List<NhiemVu> nhiemVu = vaiTroService.getNhiemVuById(maNhanVien, duan.getMaDuAn());
			vaiTro = new ArrayList<String>();
			for (NhiemVu nv : nhiemVu) {
				String getVaiTro = vaiTroService.getVaiTroById(nv.getMaVaiTro()).getTenVaiTro();
				vaiTro.add(getVaiTro);
			}
			duan.setVaiTro(vaiTro);
		}
		Map<String, Integer> ngonngu = this.thongTinKinhNghiemService.listNgonNgu(maNhanVien);
		Map<String, Integer> framework = this.thongTinKinhNghiemService.listFramework(maNhanVien);
		Map<String, Integer> database = this.thongTinKinhNghiemService.listDatabase(maNhanVien);
		model.addAttribute("listFramework", framework);
		model.addAttribute("listDatabase", database);
		model.addAttribute("listNgonNgu", ngonngu);
		model.addAttribute("hoSoNhanVien", hsnvDTO);
		return "QuanLyNhanSu/QuanLyHoSo/View/TatCaThongTinView";
	}
}

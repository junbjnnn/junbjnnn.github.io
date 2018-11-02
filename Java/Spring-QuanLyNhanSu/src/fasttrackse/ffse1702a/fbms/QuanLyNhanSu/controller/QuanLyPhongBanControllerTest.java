package fasttrackse.ffse1702a.fbms.QuanLyNhanSu.controller;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.model.entity.PhongBan;
import fasttrackse.ffse1702a.fbms.QuanLyNhanSu.service.QuanLyPhongBanService;

public class QuanLyPhongBanControllerTest {
	@Mock
	private QuanLyPhongBanService quanLyPhongBanService;

	@InjectMocks
	private QuanLyPhongBanController quanLyPhongBanController;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		MockitoAnnotations.initMocks(this);

		mockMvc = MockMvcBuilders.standaloneSetup(quanLyPhongBanController).build();
	}

	@Test
	public void testList() throws Exception {
		List<PhongBan> phongBans = new ArrayList<>();
		phongBans.add(new PhongBan());
		phongBans.add(new PhongBan());

		when(quanLyPhongBanService.listPhongBan()).thenReturn(phongBans);

		mockMvc.perform(get("/qlns/phong_ban")).andExpect(status().isOk())
				.andExpect(view().name("QuanLyNhanSu/QuanLyPhongBan/PhongBan"));
	}
}

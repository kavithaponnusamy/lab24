package co.grandcircus.lab24;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.el.stream.Optional;

@Controller
public class PizzaPartyPlanner {
	
	
	@Autowired
	private PartyRepo dao;
	
	@Autowired
	private PartyOptionRepo dao2;
	
	@RequestMapping("/")
	public String index() {
		return "redirect:/party";
	}
	@RequestMapping("/party")
	public String home(Model model) {
		List<Party> parties = dao.findAll();
		model.addAttribute("parties", parties);
		return "homepage";
	}
	
	@RequestMapping("/vote-page")
	public String listPizzaOptions(Model model) {
		List<PartyOption> partyOptions = dao2.findAll();
		model.addAttribute("partyOptions", partyOptions);
		return "vote-page";
	}
	@RequestMapping("/vote-update")
	public String listPizzaOptions1(Model model, @RequestParam("id") Long id){
		PartyOption resultPartyOption = dao2.findById(id).get();
		resultPartyOption.setVotes(resultPartyOption.getVotes()+1);
		dao2.save(resultPartyOption);
		List<PartyOption> partyOptions1 = dao2.findAll();
		model.addAttribute("partyOptions", partyOptions1);
		return "vote-page";		
	}
	
	@RequestMapping("/add-page")
	public String submitAdd(Model model, PartyOption pOption) {
		pOption.setVotes(0);
		dao2.save(pOption);
		List<PartyOption> partyOptions2 = dao2.findAll();
		model.addAttribute("partyOptions", partyOptions2);
		return "vote-page";		
	}

	@RequestMapping("/review-page")
	public String reviewPage(Model model, PartyOption pOption) {
		List<PartyOption> partyOptions3 = dao2.findByVotesGreaterThanOrderByVotesDesc(0);
		model.addAttribute("partyOptions", partyOptions3);
		return "review-page";
	}
}

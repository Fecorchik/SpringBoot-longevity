package com.longevity.web.controller.admin;

import com.longevity.web.domain.services.Order;
import com.longevity.web.domain.services.StatusScore;
import com.longevity.web.service.ClientService;
import com.longevity.web.service.services.OrderService;
import com.longevity.web.service.services.ServicesService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/admin/order")
public class AdminOrder {
    private OrderService orderService;
    private ServicesService servicesService;
    private ClientService clientService;

    public AdminOrder(OrderService orderService, ServicesService servicesService, ClientService clientService) {
        this.orderService = orderService;
        this.servicesService = servicesService;
        this.clientService = clientService;
    }

    @GetMapping("all")
    public String getAllOrder(Model model){
        model.addAttribute("orders", orderService.getAllOrder());

        model.addAttribute("services", servicesService.getAllServices());
        model.addAttribute("clients", clientService.getAllClient());
        model.addAttribute("statuses", new ArrayList<>(EnumSet.allOf(StatusScore.class)));

        System.out.println();
        return "admin/order/orders";
    }

    @GetMapping("{id}")
    public String getOrderId(@PathVariable(name = "id") Order order, Model model ){
        model.addAttribute("order", order);

        model.addAttribute("services", servicesService.getAllServices());
        model.addAttribute("clients", clientService.getAllClient());
        model.addAttribute("statuses", new ArrayList<>(EnumSet.allOf(StatusScore.class)));

        return "admin/order/order";
    }

    @PostMapping("add")
    public String addOrder(
            @RequestParam Map<String, String> form
    ){
        orderService.addOrder(form);
        return "redirect:/admin/order/all";
    }
//
//    @PostMapping("{id}/update")
//    public String updateOrder(
//            @PathVariable(name = "id") Services service,
//            @RequestParam(name = "name") String name,
//            @RequestParam(name = "price") String price
//    ){
//        servicesService.updateService(service, name, Double.parseDouble(price.replace(",",".")));
//        return "redirect:/admin/service/"+service.getId();
//    }

    @GetMapping("{id}/delete")
    public String deleteOrderById(@PathVariable(name = "id") Order order){
        orderService.deleteOrder(order);
        return "redirect:/admin/order/all";
    }
}

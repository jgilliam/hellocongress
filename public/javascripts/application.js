// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(document).ready(function() {
	$("input.legislator_name").autocomplete("/legislators.js");
	$("input#hp_search").autocomplete("/legislators.js");
	$("input#hp_search").DefaultValue("Find a legislator's page") 	
	$("input.legislator_name").DefaultValue("Find a legislator's page") 
	$("input.legislator_name_search").DefaultValue("Your full address") 	
	$("input#subscription_email").DefaultValue("Your email address")
	$('input.legislator_name').bt({ 
		positions: ['left'],
		padding: 10,
		width: 140,
		spikeLength: 20,
		spikeGirth: 20,
		cornerRadius: 20,
		fill: '#ffff99',
		strokeWidth: 1,
		strokeStyle: '#ffcc00',
	});	
	$('input#subscription_email').bt({ 
		positions: ['left'],
		padding: 10,
		width: 140,
		spikeLength: 20,
		spikeGirth: 20,
		cornerRadius: 20,
		fill: '#ffff99',
		strokeWidth: 1,
		strokeStyle: '#ffcc00',
	});	
	$('input#q').bt({ 
		positions: ['bottom'],
		padding: 10,
		width: 140,
		spikeLength: 20,
		spikeGirth: 20,
		cornerRadius: 20,
		fill: '#ffff99',
		strokeWidth: 1,
		strokeStyle: '#ffcc00',
	});
	$('input#hp_search').bt({ 
		positions: ['bottom'],
		padding: 10,
		width: 140,
		spikeLength: 20,
		spikeGirth: 20,
		cornerRadius: 20,
		fill: '#ffff99',
		strokeWidth: 1,
		strokeStyle: '#ffcc00',
	});	
	$('input.bt').bt({ 
		trigger: ['focus', 'blur'], 
		positions: ['right'],
		padding: 10,
		width: 140,
		spikeLength: 20,
		spikeGirth: 20,
		cornerRadius: 20,
		fill: '#ffff99',
		strokeWidth: 1,
		strokeStyle: '#ffcc00',
	});
	$('#legislator_info').bt({ 
		positions: ['bottom'],
		padding: 10,
		width: 180,
		spikeLength: 10,
		spikeGirth: 20,
		cornerRadius: 20,
		fill: '#ffff99',
		strokeWidth: 1,
		strokeStyle: '#ffcc00',
	});	
});
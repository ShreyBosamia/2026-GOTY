using Godot;
using System;

using System.Collections.Generic;

public partial class Turn_Based_Combat : Node
{
	private List<Fighter> fighters;
	private bool fight_active;
	private int rounds_complete;
	
	public Turn_Based_Combat(List<Character> characters) {
		this.rounds_complete = 0;
		
		this.fighters = new List<Fighter>(characters.Count);
		
		for (int i = 0; i < characters.Count; i++) {
			Fighter new_fighter = new Fighter(characters[i]);
			this.fighters.Add(new_fighter);
		}
		
		this.fight_active = false;
	}
	
	public void start() {
		this.fight_active = true;
		while (this.fight_active) {
			do_round();
			/* round over, recalculate turn orders for next round */
			recalculate_turn_order();
			this.rounds_complete++;
		}
	}
	
	private void do_round() {
		for (int i = 0; i < this.fighters.Count; i++) {
			Fighter cur_fighter = this.fighters[i];
			cur_fighter.do_turn();
		}
	}
	
	private void do_turn(Character fighter) {
	}
	
	/* some moves might change a character's priority in a fight. */
	private void recalculate_turn_order() {
	}
}

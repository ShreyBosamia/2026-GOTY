using Godot;
using System;

public partial class Player : Character
{
	private Inventory inventory;
	
	public Player(int points_hit) : base(points_hit) {
		this.inventory = new Inventory();
	}
}

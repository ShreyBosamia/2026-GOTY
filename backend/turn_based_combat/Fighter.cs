using Godot;
using System;

public partial class Fighter : Node
{
	private Character character;
	private int priority;
	
	public Fighter(Character character) {
		this.priority = 0;
		this.character = character;
	}
	
	public do_turn() {
	}
}

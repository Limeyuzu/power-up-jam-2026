using System.Collections.Generic;
using Godot;

public partial class Player : CharacterBody2D
{
    private float _runSpeedInitial = 100;
    private float _runSpeed = 100;
    private float _runSpeedCap = 350;
    private float _friction = 0.85f;

    public void OnResetVelocity() => Velocity = Vector2.Zero;

    private bool CanMove() => true;

    public override void _PhysicsProcess(double delta)
    {
        UpdateVelocity();
        MoveAndSlide();
    }

    private void UpdateVelocity()
    {
        var velocity = Velocity;

        var inputDir = CanMove() ? Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down") : Vector2.Zero;
        velocity += inputDir * (velocity.Length() < _runSpeedInitial ? _runSpeedInitial : _runSpeed);

        velocity *= _friction;

        velocity = velocity.LimitLength(_runSpeedCap);

        Velocity = velocity;
    }
}
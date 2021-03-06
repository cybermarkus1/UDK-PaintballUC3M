class uc3mPaint_1p_Attachment extends UTWeaponAttachment;

var ParticleSystem BeamTemplate;

var int CurrentPath;

simulated function SetMuzzleFlashParams(ParticleSystemComponent PSC)
{
	local float PathValues[3];
	local int NewPath;
	Super.SetMuzzleFlashparams(PSC);
	if (Instigator.FiringMode == 0)
	{
		NewPath = Rand(3);
		if (NewPath == CurrentPath)
		{
			NewPath++;
		}
		CurrentPath = NewPath % 3;

		PathValues[CurrentPath % 3] = 1.0;
		PSC.SetFloatParameter('Path1',PathValues[0]);
		PSC.SetFloatParameter('Path2',PathValues[1]);
		PSC.SetFloatParameter('Path3',PathValues[2]);
//			CurrentPath++;
	}
	else if (Instigator.FiringMode == 3)
	{
		PSC.SetFloatParameter('Path1',1.0);
		PSC.SetFloatParameter('Path2',1.0);
		PSC.SetFloatParameter('Path3',1.0);
	}
	else
	{
		PSC.SetFloatParameter('Path1',0.0);
		PSC.SetFloatParameter('Path2',0.0);
		PSC.SetFloatParameter('Path3',0.0);
	}

}

defaultproperties
{
	// Weapon SkeletalMesh
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'PaintBall.Mesh.PaintBall_1p'
		Scale=0.10
		Translation=(X=1)
		Rotation=(Pitch=-16300,Yaw=-16300,Roll=0) 
	End Object

	//DefaultImpactEffect=(ParticleTemplate=none,Sound=SoundCue'blaster-e11.Sounds.HitWallS')
	BulletWhip=SoundCue'A_Weapon_ShockRifle.Cue.A_Weapon_SR_WhipCue'
	
	//MuzzleFlashSocket=MuzzleFlashSocket
 //       MuzzleFlashPSCTemplate=blaster-e11.Particle.Shoot
	
	//MuzzleFlashAltPSCTemplate=blaster-e11.Particle.Shoot
	MuzzleFlashColor=(R=200,G=0,B=0,A=255)
	MuzzleFlashDuration=0.33;
	MuzzleFlashLightClass=class'uc3mPaint_1p_MuzzleFlash'
	WeaponClass=class'uc3mPaint_1p_Paintgun'
}

	
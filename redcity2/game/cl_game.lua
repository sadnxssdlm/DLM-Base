IIdX = {}
IIdX.ID=PlayerId() 
IIdX.NamePlayers = GetPlayerName(IIdX.ID)


local QSDQox={}

QSDQox.Vehicle=0
QSDQox.Ped=0
QSDQox.Weapon={}
QSDQox.DecorItem={}
QSDQox.Struct={}
QSDQox.Sex=0
QSDQox.InstanceID=0
QSDQox.InVehicle=false
QSDQox.InCombat=false
QSDQox.Ragdoll=false
QSDQox.Dead=false
QSDQox.IsDead=false
QSDQox.Pos=vector3(0.0,0.0,0.0)
QSDQox.Heading=0.0
QSDQox.ZoneName=""
QSDQox.Invincible=false
QSDQox.InteriorID=0
QSDQox.Armed=false
QSDQox.Shooting=false
QSDQox.Cuffed=false
QSDQox.Health=0
QSDQox.Armor=0
QSDQox.Visible=true
QSDQox.Freezed=false

GEC=GetEntityCoords
GEH=GetEntityHeading
HqC=GetEntityHealth
GPA=GetPedArmour
IPS=IsPedShooting
GIF=GetInteriorFromEntity
GPP=GetPlayerPed
IPAV=IsPedInAnyVehicle
GNZ=GetNameOfZone
IPAd=IsPedArmed
IPC=IsPedCuffed
N9L=GetVehiclePedIsUsing
hDc_M=GetPedConfigFlag

function QSDQox:Matrix()
    return 
    GetEntityMatrix(self.Ped)
end
function QSDQox:GetVehicle()
    local qW0lRiD1=self.InVehicle and N9L(self.Ped)
    return qW0lRiD1 and qW0lRiD1 > 0 and qW0lRiD1 
end;

function QSDQox:Set(iD1IUx,JLCOx_ak)
    QSDQox[iD1IUx]=JLCOx_ak 
end
function QSDQox:Freeze(hPQ)
    if hPQ~=nil then 
        self.Freezed=hPQ 
    else 
        self.Freezed=not self.Freezed 
    end;
    FreezeEntityPosition(self.Ped,self.Freezed)
end
function QSDQox:GetFlag(R1FIoQI)
    return hDc_M(self.Ped,R1FIoQI,1)
end
function QSDQox:SetFlag(NsoTwDs,HGli)
    SetPedConfigFlag(self.Ped,NsoTwDs,HGli)
end;
function LocalPlayer()
    return QSDQox 
end
Citizen.CreateThread(function()
    QSDQox.ID=PlayerId()
    while true do
        QSDQox.Pos=GEC(QSDQox.Ped)
        QSDQox.Heading=GEH(QSDQox.Ped)
        QSDQox.Health=HqC(QSDQox.Ped)
        QSDQox.Armor=GPA(QSDQox.Ped)
        QSDQox.Shooting=IPS(QSDQox.Ped)
        QSDQox.InteriorID=GIF(QSDQox.Ped)
        Citizen.Wait(0)
    end 
end)
Citizen.CreateThread(function()
    while true do
        QSDQox.Ped=GPP(-1)
        QSDQox.InVehicle=IPAV(QSDQox.Ped)
        QSDQox.ZoneName=GNZ(QSDQox.Pos)
        QSDQox.Armed=IPAd(QSDQox.Ped,6)
        QSDQox.Cuffed=IPC(QSDQox.Ped)
        Citizen.Wait(1000)
    end 
end)
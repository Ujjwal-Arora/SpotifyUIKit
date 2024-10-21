//
//  AuthResponse.swift
//  SpotifyUIKit
//
//  Created by Ujjwal Arora on 18/10/24.
//

import Foundation

//Response :
/*
 {"access_token":"BQDu7PP1cbxw-35iVcCMinE7dk1G6XSV_tEs4Z4qVCW1Q-nAjwy0X5tpPMpeLVIda8yBihjDI7YGTHhHHiBkEwPVTNd1xYhVb8gTDjbgTehNkkfzX_2ItSfEbifr6mXq9kD1-L-cIZWdDf34Dx9kze30JnNmfuq4TUQ6-8mc0I_VIRj6d4x8ByCMQH71ahYcHxWiRR-fppEoeA9BL10_pD8","token_type":"Bearer","expires_in":3600,"refresh_token":"AQAAX4bfkdDRcBNtTS2e1KRS8u3TTtpI4UAYY1WzwgDQ7jmIkRcWUCWb3--ETBTO8NfPdLOW74EBm2EKeLIiZnoBIrSzKjKuNHcUYbe21f1y3s_Oir_T2bz89XY_ReQfpf4","scope":"user-read-private"}
 */

struct AuthResponse : Codable{
    let accessToken : String
    let tokenType: String
    let expiresIn: Int
    let refreshToken :String?
    let scope: String
    
}

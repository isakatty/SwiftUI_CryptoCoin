//
//  CoinDetailView.swift
//  SwiftUI_CryptoCoin
//
//  Created by Jisoo Ham on 9/14/24.
//

import SwiftUI
import Charts

struct CoinDetailView: View {
    var coinDetailInfo: CoinMarketResponseDTO

    var body: some View {
        ScrollView {
            makeCoinNameView()
            CoinDetailCurrencyView(
                price: coinDetailInfo.current_price,
                increment: coinDetailInfo.price_change_percentage_24h
            )
                .padding(.bottom, 30)
            makeStocksView()
            Chart {
                ForEach(
                    0..<coinDetailInfo.sparkline_in_7d.price.count,
                    id: \.self
                ) { index in
                    AreaMark(
                        x: .value("Date", index),
                        y: .value("Price", coinDetailInfo.sparkline_in_7d.price[index])
                    )
                    .foregroundStyle(.purple)
                }
            }
            .chartXScale(domain: 0...167)
            .chartXAxis {
                AxisMarks {
                    AxisGridLine().foregroundStyle(.clear)
                }
            }
            .chartYAxis {
                AxisMarks {
                    AxisGridLine().foregroundStyle(.clear)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            HStack {
                Spacer()
                Text("최신")
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func makeCoinNameView() -> some View {
        return HStack {
            AsyncImage(url: URL(string: coinDetailInfo.image)) { image in
                image
                    .resizable()
                    .frame(width: 40, height: 40)
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "star.fill")
                    .frame(width: 40, height: 40)
                    .scaledToFill()
            }
            Text(coinDetailInfo.name)
                .font(.largeTitle)
                .bold()
            Spacer()
        }
    }
    private func makeStocksView() -> some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                StockWithTitleView(title: "고가", price: coinDetailInfo.high_24h, isHighest: true)
                StockWithTitleView(title: "저가", price: coinDetailInfo.low_24h, isHighest: false)
            }
            HStack {
                StockWithTitleView(title: "신고점", price: coinDetailInfo.ath, isHighest: true)
                StockWithTitleView(title: "신저점", price: coinDetailInfo.atl, isHighest: false)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CoinDetailView(coinDetailInfo: .init(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        current_price: 77421322,
        price_change_percentage_24h: 3.73969,
        low_24h: 74630375,
        high_24h: 78364591,
        ath: 98576718, 
        atl: 75594,
        ath_date: "2024-06-07T13:55:20.414Z",
        last_updated: "2024-09-12T14:55:01.773Z",
        sparkline_in_7d: .init(price: [56671.3678382719, 56758.7914782489, 57125.4501514749, 56404.2996042286, 56047.6202001659, 56443.4979553638, 56522.5720684684, 56414.4543926887, 56040.0389024861, 56200.6491167695, 56037.7875186584, 56116.0814643296, 56276.0370138709, 56004.4975758197, 56538.2282152262, 56746.1663951293, 56707.7399845138, 56511.211825423, 56447.1715344423, 56366.6697028385, 55812.4431819262, 55782.3739501078, 55937.238171765, 56048.5520052827, 55883.9871513014, 56805.5510635713, 55324.9147453113, 54481.5103353702, 54008.6956406352, 54302.8434892181, 53760.5950543657, 53752.943586111, 53491.8274530482, 53304.6152737462, 53803.4784003458, 53700.6173716422, 53955.1133628227, 53900.2835881804, 53794.8984213326, 53813.3909083892, 53806.0739526737, 54028.176148239, 54171.766500097, 54276.0783999555, 54260.8142383576, 54358.7101299629, 54312.3325623589, 54410.9583698601, 54433.3802725979, 54560.4998608569, 54601.9596681715, 54641.1817871378, 54814.8188490265, 54512.2945999758, 54149.5518521795, 54238.7493904637, 54358.1275506898, 54038.4122829419, 54014.2351302877, 53988.8714695506, 54121.4729118939, 54260.8669436535, 54333.7976174946, 54365.4479857864, 54445.118714845, 54485.330286433, 54397.3784858486, 54469.3459462189, 54401.9528139907, 54563.2383807909, 54594.6729741873, 54607.2353723198, 54539.4472682243, 54056.8928725689, 54395.8592913702, 54154.2810384195, 53860.1209307005, 53979.4495790728, 54353.6648512209, 54480.8436272571, 54311.8141630339, 54382.032655627, 54387.2427347407, 54741.1679385244, 54792.4075576858, 55379.6540535633, 54997.5293585294, 55067.7423441566, 55135.1754493291, 54821.4394612349, 54707.4954986095, 54800.7574042688, 54965.2653553328, 55430.4615404494, 55134.2678262055, 55246.2305613595, 55256.1738963913, 55362.6134087652, 55586.8295430007, 55099.0332377082, 55507.2103294926, 56545.1812571269, 56492.669499075, 56719.4534341167, 56917.776146828, 57576.2233427767, 57635.4425557559, 57226.9261505355, 56770.1782252249, 56890.8025225628, 56731.5666387901, 56769.0474647635, 56553.3214928398, 56781.9166219116, 56802.4082496509, 56953.6748534595, 57340.3740221007, 56991.0631129947, 57011.4464791158, 57145.0209333086, 57321.6757707906, 56914.5676462322, 56976.9815615558, 56984.7033427791, 56629.0801646607, 56853.1911317626, 57637.3493168204, 57821.4970604571, 57842.0651207156, 57623.7834710225, 57635.7001959233, 57842.505315405, 57506.0375888799, 57645.7790230768, 57004.5054238896, 56915.6897063726, 56658.9139769017, 56276.9878767537, 56247.9352095647, 56447.1225344463, 56662.7781301837, 56614.2892268853, 56559.514992331, 56645.1860071597, 56821.1865483274, 56964.9133094105, 55901.7406428885, 55973.8859302244, 56918.388109706, 57513.1149722851, 57749.3173909131, 57571.6140955257, 57583.5894297991, 57561.0534311723, 57314.0241079525, 57479.5483629006, 57510.7988303985, 57624.3518919609, 57935.4564689897, 58218.6788057249, 58120.2329067886, 57938.7975496893, 57888.3698563871, 58253.6385647893, 58215.3995189784, 58026.0090787585, 58091.0097265676])
    ))
}

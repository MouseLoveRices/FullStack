import React from 'react'
import { Swiper, SwiperSlide } from 'swiper/react';

// Import Swiper styles
import 'swiper/css';
import 'swiper/css/effect-coverflow';
import 'swiper/css/pagination';

// import required modules
import { Autoplay, EffectCoverflow, Navigation, Pagination } from 'swiper/modules';
import CardProd from '../card/CardProd';

export default function Slider3(props) {
    const { arr } = props
    return (
        <>
            <Swiper
                autoplay={{
                    delay: 3000,
                    disableOnInteraction: true,
                }}
                effect={'coverflow'}
                grabCursor={true}
                centeredSlides={true}
                slidesPerView={4}
                spaceBetween={30}
                coverflowEffect={{
                    rotate: 0,
                    stretch: 0,
                    depth: 100,
                    modifier: 1,
                    slideShadows: true,
                }}
                pagination={true}
                modules={[EffectCoverflow, Pagination, Autoplay]}
                className="mySwiper"
                breakpoints={{
                    // when window width is >= 320px
                    320: {
                        slidesPerView: 1,
                        spaceBetween: 10,
                    },
                    // when window width is >= 480px
                    770: {
                        slidesPerView: 2,
                        spaceBetween: 10,
                    },
                    // when window width is >= 640px
                    996: {
                        slidesPerView: 3,
                        spaceBetween: 10,
                    },
                    // when window width is >= 1024px
                    1404: {
                        slidesPerView: 4,
                        spaceBetween: 40,
                    },
                }}

                data-aos="fade-down-left"

            >
                {
                    arr.map((item, index) => (
                        <SwiperSlide>
                            <CardProd />
                        </SwiperSlide>
                    ))
                }

            </Swiper>
        </>
    )
}

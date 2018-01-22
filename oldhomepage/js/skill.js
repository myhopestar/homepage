 $(function () {
                                    $('.list .skilllist').mouseenter(function () {
                                        $(this).find('img').animate({ left: "30px", opacity: "0" }, 300, function () {
                                            $(this).css({ left: '-30px' });
                                            $(this).animate({ left: '0px', opacity: '1' }, 600)
                                        })
                                    });
                                    $('.list .skill1').mouseenter(function () {
                                        $(".skills").eq(0).css("display", "block");
                                        $(".skills").eq(1).css("display", "none");
                                        $(".skills").eq(2).css("display", "none");
                                        $(".skills").eq(3).css("display", "none");
                                    });
                                    $('.list .skill2').mouseenter(function () {
                                        $(".skills").eq(0).css("display", "none");
                                        $(".skills").eq(1).css("display", "block");
                                        $(".skills").eq(2).css("display", "none");
                                        $(".skills").eq(3).css("display", "none");
                                    });
                                    $('.list .skill3').mouseenter(function () {
                                        $(".skills").eq(0).css("display", "none");
                                        $(".skills").eq(1).css("display", "none");
                                        $(".skills").eq(2).css("display", "block");
                                        $(".skills").eq(3).css("display", "none");
                                    });
                                    $('.list .skill4').mouseenter(function () {
                                        $(".skills").eq(0).css("display", "none");
                                        $(".skills").eq(1).css("display", "none");
                                        $(".skills").eq(2).css("display", "none");
                                        $(".skills").eq(3).css("display", "block");
                                    });
                                })